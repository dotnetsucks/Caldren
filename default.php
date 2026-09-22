<?php

include __DIR__ . "/Config/includes.php";

$error = "";

function grandom($length) {
    $characters = '0123456789abcdefghijklmnopqrstuvwxyz';
    $charactersLength = strlen($characters);
    $randomString = '';

    for ($i = 0; $i < $length; $i++) {
        $randomIndex = random_int(0, $charactersLength - 1);
        $randomString .= $characters[$randomIndex];
    }

    return $randomString;
}


/*
 * LOGIN
 */
if ($_SERVER['REQUEST_METHOD'] === 'POST') {

    $usernamefield = trim($_POST['usernamefield'] ?? '');
    $passwordfield = $_POST['passwordfield'] ?? '';

    if ($usernamefield === '' || $passwordfield === '') {

        $error = "<p style='color:red;'>Please fill in all fields.</p>";

    } else {

        $q = $db->prepare("
            SELECT *
            FROM users
            WHERE name = :username
            LIMIT 1
        ");

        $q->execute([
            'username' => $usernamefield
        ]);

        $result = $q->fetch(PDO::FETCH_ASSOC);

        if (!$result) {

            $error = "<p style='color:red;'>Invalid login credentials.</p>";

        } elseif (
            !isset($result['passwd']) ||
            !password_verify($passwordfield, $result['passwd'])
        ) {

            $error = "<p style='color:red;'>Invalid login credentials.</p>";

        } else {

            session_regenerate_id(true);

            $_SESSION['loggedin'] = true;
            $_SESSION['name'] = $result['name'];
            $_SESSION['id'] = (int)$result['id'];

            if (!empty($result['authentication'])) {

                $newToken = $result['authentication'];

            } else {

                $newToken = grandom(36);

                $a = $db->prepare("
                    UPDATE users
                    SET authentication = :token
                    WHERE id = :id
                ");

                $a->execute([
                    'token' => $newToken,
                    'id' => $result['id']
                ]);
            }

            $cookieSecure = isset($_SERVER['HTTPS']) &&
                            $_SERVER['HTTPS'] !== 'off';

            setcookie(
                "_ROBLOSECURITY",
                $newToken,
                [
                    'expires' => 0,
                    'path' => '/',
                    'secure' => $cookieSecure,
                    'httponly' => true,
                    'samesite' => 'Lax'
                ]
            );

            $_COOKIE["_ROBLOSECURITY"] = $newToken;

            header("Location: /Default.php");
            exit;
        }
    }
}


/*
|--------------------------------------------------------------------------
| DATABASE HOME PAGE DATA
|--------------------------------------------------------------------------
*/


/*
 * ROBLOX FACTS
 */
$robloxFacts = [];

try {

    $factQuery = $db->query("
        SELECT fact
        FROM homepage_facts
        WHERE active = 1
        ORDER BY sort_order ASC, id ASC
    ");

    $robloxFacts = $factQuery->fetchAll(PDO::FETCH_COLUMN);

} catch (PDOException $e) {

    $robloxFacts = [];
}


/*
 * ONLINE USERS
 */
$onlineUsers = 0;

try {

    $onlineQuery = $db->query("
        SELECT COUNT(*)
        FROM users
        WHERE lastseen >= (NOW() - INTERVAL 5 MINUTE)
    ");

    $onlineUsers = (int)$onlineQuery->fetchColumn();

} catch (PDOException $e) {

    $onlineUsers = 0;
}


/*
 * ONLINE STAFF
 */
$onlineStaff = 0;

try {

    $staffQuery = $db->query("
        SELECT COUNT(*)
        FROM users
        WHERE admin > 0
        AND lastseen >= (NOW() - INTERVAL 5 MINUTE)
    ");

    $onlineStaff = (int)$staffQuery->fetchColumn();

} catch (PDOException $e) {

    $onlineStaff = 0;
}


/*
 * TOTAL USERS
 */
$totalUsers = 0;

try {

    $totalQuery = $db->query("
        SELECT COUNT(*)
        FROM users
    ");

    $totalUsers = (int)$totalQuery->fetchColumn();

} catch (PDOException $e) {

    $totalUsers = 0;
}


/*
|--------------------------------------------------------------------------
| ACTIVE ADVERTISEMENT
|--------------------------------------------------------------------------
*/

$activeAdBox = null;
$activeAdBanner = null;

try {
    /*
     * Ads are selected randomly on every page load.
     * Older ads without an ad_type are treated as box ads.
     */
    $adColumnCheck = $db->query("
        SELECT COLUMN_NAME
        FROM information_schema.columns
        WHERE table_schema = DATABASE()
          AND table_name = 'ads'
    ");
    $adColumns = $adColumnCheck->fetchAll(PDO::FETCH_COLUMN);

    if (!in_array('ad_type', $adColumns, true)) {
        $db->exec("ALTER TABLE ads ADD COLUMN ad_type VARCHAR(20) NOT NULL DEFAULT 'box'");
        $adColumns[] = 'ad_type';
    }

    if (!in_array('group_id', $adColumns, true)) {
        $db->exec("ALTER TABLE ads ADD COLUMN group_id INT NULL DEFAULT NULL");
        $adColumns[] = 'group_id';
    }

    $activeAdBoxQuery = $db->query("
        SELECT id, title, image, link, group_id
        FROM ads
        WHERE active = 1
          AND (ad_type = 'box' OR ad_type IS NULL OR ad_type = '')
        ORDER BY RAND()
        LIMIT 1
    ");
    $activeAdBox = $activeAdBoxQuery->fetch(PDO::FETCH_ASSOC);

    $activeAdBannerQuery = $db->query("
        SELECT id, title, image, link, group_id
        FROM ads
        WHERE active = 1
          AND ad_type = 'banner'
        ORDER BY RAND()
        LIMIT 1
    ");
    $activeAdBanner = $activeAdBannerQuery->fetch(PDO::FETCH_ASSOC);

} catch (PDOException $e) {
    $activeAdBox = null;
    $activeAdBanner = null;
}


/*
|--------------------------------------------------------------------------
| FEATURED GAME
|--------------------------------------------------------------------------
*/

$featuredGame = null;

try {

    $tableQuery = $db->query("
        SELECT COUNT(*)
        FROM information_schema.tables
        WHERE table_schema = DATABASE()
        AND table_name = 'games'
    ");

    $gamesTableExists = ((int)$tableQuery->fetchColumn() > 0);

    if ($gamesTableExists) {

        $columnQuery = $db->query("
            SELECT COLUMN_NAME
            FROM information_schema.columns
            WHERE table_schema = DATABASE()
            AND table_name = 'games'
        ");

        $gameColumns = $columnQuery->fetchAll(PDO::FETCH_COLUMN);

        $gameIdColumn = null;
        $gameNameColumn = null;
        $gameCreatorColumn = null;

        foreach ($gameColumns as $column) {

            $lowerColumn = strtolower($column);

            if ($gameIdColumn === null) {

                if (
                    $lowerColumn === 'id' ||
                    $lowerColumn === 'gameid' ||
                    $lowerColumn === 'placeid'
                ) {
                    $gameIdColumn = $column;
                }
            }

            if ($gameNameColumn === null) {

                if (
                    $lowerColumn === 'name' ||
                    $lowerColumn === 'title' ||
                    $lowerColumn === 'gamename'
                ) {
                    $gameNameColumn = $column;
                }
            }

            if ($gameCreatorColumn === null) {

                if (
                    $lowerColumn === 'creator' ||
                    $lowerColumn === 'creatorname' ||
                    $lowerColumn === 'owner' ||
                    $lowerColumn === 'ownername'
                ) {
                    $gameCreatorColumn = $column;
                }
            }
        }

        if (
            $gameIdColumn !== null &&
            $gameNameColumn !== null
        ) {

            $safeIdColumn =
                '`' . str_replace('`', '``', $gameIdColumn) . '`';

            $safeNameColumn =
                '`' . str_replace('`', '``', $gameNameColumn) . '`';

            if ($gameCreatorColumn !== null) {

                $safeCreatorColumn =
                    '`' . str_replace('`', '``', $gameCreatorColumn) . '`';

                $creatorSQL =
                    $safeCreatorColumn . " AS creator";

            } else {

                $creatorSQL =
                    "'' AS creator";
            }

            $gameSQL = "
                SELECT
                    $safeIdColumn AS game_id,
                    $safeNameColumn AS game_name,
                    $creatorSQL
                FROM games
                ORDER BY $safeIdColumn DESC
                LIMIT 1
            ";

            $gameQuery = $db->query($gameSQL);

            $featuredGame = $gameQuery->fetch(PDO::FETCH_ASSOC);
        }
    }

} catch (PDOException $e) {

    $featuredGame = null;
}


include __DIR__ . "/Config/header.php";

?>

<div id="Body">

<?php if (isset($auth) && $auth == true) { ?>

    <div class="FrontPagePanel" id="SignInPane">

        <div id="LoginViewContainer">

            <div id="LoginView">

                <h5>Logged in</h5>

                <div class="AspNet-Login">

                    <a
                        title="<?php echo htmlspecialchars($_USER['name'] ?? $_SESSION['name'] ?? 'User'); ?>"
                        href="/User.aspx"
                        style="display:inline-block;height:190px;width:152px;cursor:pointer;"
                    >

                        <img
                            src="/avatar.php?ID=<?php echo (int)($_USER['id'] ?? $_SESSION['id'] ?? 0); ?>&c=<?php echo rand(0, 1000000); ?>"
                            style="display:inline-block;margin-top:15px;"
                            border="0"
                            id="img"
                            height="150"
                            alt="<?php echo htmlspecialchars($_USER['name'] ?? $_SESSION['name'] ?? 'User'); ?>"
                        >

                    </a>

                </div>

            </div>

        </div>

    </div>

<?php } else { ?>

    <div class="FrontPagePanel" id="SignInPane">

        <div id="LoginViewContainer">

            <div id="LoginView">

                <h5>Member Login</h5>

                <div class="AspNet-Login">

                    <form method="post">

                        <div class="AspNet-Login">

                            <div class="AspNet-Login-UserPanel">

                                <label
                                    for="usernamefield"
                                    class="Label"
                                >
                                    Character Name
                                </label>

                                <input
                                    name="usernamefield"
                                    type="text"
                                    id="usernamefield"
                                    tabindex="1"
                                    class="Text"
                                    value="<?php echo htmlspecialchars($_POST['usernamefield'] ?? '', ENT_QUOTES, 'UTF-8'); ?>"
                                />

                            </div>

                            <div class="AspNet-Login-PasswordPanel">

                                <label
                                    for="passwordfield"
                                    class="Label"
                                >
                                    Password
                                </label>

                                <input
                                    name="passwordfield"
                                    type="password"
                                    id="passwordfield"
                                    tabindex="2"
                                    class="Text"
                                />

                            </div>

                            <?php echo $error; ?>

                            <div class="AspNet-Login-SubmitPanel">

                                <button
                                    class="Button"
                                    type="submit"
                                    name="Login"
                                    id="Login"
                                >
                                    Login
                                </button>

                            </div>

                            <div class="AspNet-Login-PasswordRecoveryPanel">

                                <a
                                    tabindex="5"
                                    href="Login/ResetPasswordRequest.aspx"
                                >
                                    Forgot your password?
                                </a>

                            </div>

                        </div>

                    </form>

                </div>

            </div>

        </div>

    </div>

<?php } ?>


    <div class="FrontPagePanel" id="Movie">

        <object width="424" height="250">

            <param
                name="movie"
                value="https://www.youtube.com/embed/JYnMb_a0Kqg?si=j-9Ek-QRTQ313rG8"
            >

            <param
                name="allowFullScreen"
                value="true"
            >

            <param
                name="allowscriptaccess"
                value="always"
            >

            <embed
                src="https://www.youtube.com/embed/JYnMb_a0Kqg?si=j-9Ek-QRTQ313rG8"
                type="application/x-shockwave-flash"
                allowscriptaccess="always"
                allowfullscreen="true"
                width="424"
                height="250"
            >

        </object>

    </div>


    <!--
    ============================================================
    ADVERTISEMENT BESIDE VIDEO
    ============================================================
    -->

    <div class="FrontPagePanel" id="FrontPageRectangleAd">

        <div style="overflow:hidden;">

            <?php if ($activeAdBox) { ?>

                <a
                    href="<?php echo htmlspecialchars($activeAdBox['link'], ENT_QUOTES, 'UTF-8'); ?>"
                    target="_blank"
                >

                    <img
                        src="<?php echo htmlspecialchars($activeAdBox['image'], ENT_QUOTES, 'UTF-8'); ?>"
                        title="<?php echo htmlspecialchars($activeAdBox['title'], ENT_QUOTES, 'UTF-8'); ?>"
                        alt="<?php echo htmlspecialchars($activeAdBox['title'], ENT_QUOTES, 'UTF-8'); ?>"
                        border="0"
                        width="300"
                        height="250"
                        style="display:block;"
                    />

                </a>

            <?php } else { ?>

                <div
                    style="
                        width:300px;
                        height:250px;
                        text-align:center;
                    "
                >
                    No advertisement available.
                </div>

            <?php } ?>


            <a
                id="ctl00_cphRoblox_LargeRectAd_ReportAdButton"
                title="click to give feedback on an ad"
                class="BadAdButton"
                href="/ads.php"
            >
                [ feedback ]
            </a>

        </div>

    </div>


    <div class="FrontPagePanel" id="SalesPitch">

        <a
            id="ctl00_cphRoblox_MoneyMachine_PlayNowButton"
            href="Games.aspx"
        >

            <img
                src="2009 theme/images/PlayNow3.png"
                border="0"
            />

        </a>

    </div>


    <div class="FrontPagePanel" id="RandomFacts">

        <div id="ctl00_cphRoblox_RandomFacts_pRandomFacts">

            <h3 style="text-align:center;">
                CALDREN Facts
            </h3>

            <div
                id="marqueecontainer"
                onmouseover="copyspeed=pausespeed"
                onmouseout="copyspeed=marqueespeed"
            >

                <div
                    id="vmarquee"
                    style="position:absolute;"
                >

                    <?php if (!empty($robloxFacts)) { ?>

                        <?php foreach ($robloxFacts as $fact) { ?>

                            <div class="RandomFactoid">

                                <img src="images/House.png"/>

                                <?php echo htmlspecialchars($fact, ENT_QUOTES, 'UTF-8'); ?>

                            </div>

                        <?php } ?>

                    <?php } ?>


                    <div class="RandomFactoid">

                        <img src="/images/House.png"/>

                        <b><?php echo number_format($onlineUsers); ?></b>
                        players are currently online

                    </div>


                    <div class="RandomFactoid">

                        <img src="images/Admin.png"/>

                        <b><?php echo number_format($onlineStaff); ?></b>
                        staff members are currently online

                    </div>


                    <div class="RandomFactoid">

                        <img src="/images/Shirt.png"/>

                        Caldren has
                        <b><?php echo number_format($totalUsers); ?></b>
                        registered users

                    </div>

                </div>

            </div>

        </div>

    </div>


    <div class="FrontPagePanel" id="WhatsNew">

        <div>

            <div style="text-align:center;">

                <h3>

                    Featured Free Game:

                    <span id="ctl00_cphRoblox_FeaturedGames_GameName">

                        <?php

                        if ($featuredGame) {

                            echo htmlspecialchars(
                                $featuredGame['game_name'],
                                ENT_QUOTES,
                                'UTF-8'
                            );

                        } else {

                            echo "No games available";

                        }

                        ?>

                    </span>

                </h3>

            </div>


            <?php if ($featuredGame) { ?>

                <div style="float:left;">

                    <div style="margin:0px 5px 5px 5px;">

                        <a
                            id="ctl00_cphRoblox_FeaturedGames_AssetThumbnailImage"
                            title="<?php echo htmlspecialchars($featuredGame['game_name'], ENT_QUOTES, 'UTF-8'); ?>"
                            href="Item.aspx?ID=<?php echo urlencode($featuredGame['game_id']); ?>"
                            style="display:inline-block;"
                        >

                            <img
                                src=""
                                border="0"
                                alt="<?php echo htmlspecialchars($featuredGame['game_name'], ENT_QUOTES, 'UTF-8'); ?>"
                            />

                        </a>

                    </div>

                </div>


                <div style="float:right;">

                    <div style="margin:0px 5px 5px 2px;text-align:center;">

                        <a
                            id="ctl00_cphRoblox_FeaturedGames_PlayThis"
                            title="Play this free game!"
                            href="Item.aspx?ID=<?php echo urlencode($featuredGame['game_id']); ?>"
                        >

                            <img
                                title="Play this free game!"
                                src="/images/PlayThis.png"
                                border="0"
                            />

                        </a>

                        <div id="LastUpdate">
                            Updated: Recently
                        </div>

                        <div id="Favorited">
                            Featured game from database
                        </div>

                        <div
                            id="ctl00_cphRoblox_FeaturedGames_VisitedPanel"
                            class="Visited"
                        >
                            Game ID:
                            <?php echo htmlspecialchars(
                                $featuredGame['game_id'],
                                ENT_QUOTES,
                                'UTF-8'
                            ); ?>
                        </div>

                        <div id="Creator" class="Creator">

                            <div class="Avatar">

                                <a
                                    title="<?php echo htmlspecialchars(
                                        $featuredGame['creator'] ?: 'Unknown',
                                        ENT_QUOTES,
                                        'UTF-8'
                                    ); ?>"
                                    href="#"
                                    onclick="return false;"
                                    style="display:inline-block;cursor:pointer;"
                                >

                                    <img
                                        src=""
                                        border="0"
                                        alt="<?php echo htmlspecialchars(
                                            $featuredGame['creator'] ?: 'Unknown',
                                            ENT_QUOTES,
                                            'UTF-8'
                                        ); ?>"
                                    />

                                </a>

                            </div>

                            Creator:

                            <a href="#">

                                <?php echo htmlspecialchars(
                                    $featuredGame['creator'] ?: 'Unknown',
                                    ENT_QUOTES,
                                    'UTF-8'
                                ); ?>

                            </a>

                        </div>

                    </div>

                </div>

            <?php } else { ?>

                <div style="text-align:center;padding:20px;">

                    No games are currently available in the database.

                </div>

            <?php } ?>

        </div>

    </div>


    <div class="FrontPagePanel" id="ParentsCorner">

        <div id="Inside">

            <img
                id="ctl00_cphRoblox_ShieldImg"
                class="ShieldImage"
                src="images/SuperSafe32.png"
                border="0"
            />

            <div
                style="float:left;font-size:x-large;height:42px;width:220px;text-align:center;"
            >
                Parents' Corner
            </div>

            <div style="clear:left;"></div>

            <p>
                We do not allow Kids under age of 13 or ur Account will be terminated so if u are under age of 13 then leave ur not welcome
            </p>

            <a
                class="Button"
                href="#"
                onclick="return false;"
            >
                Learn More
            </a>

            <a
                class="Button"
                href="#"
                onclick="return false;"
            >
                Access Parent Account
            </a>

            <a href="info/Privacy.aspx">

                <div
                    style="width:120px;float:left;padding:5px;font-size:medium;"
                >
                    Privacy Policy
                </div>

            </a>

            <a
                class="TrusteeSeal"
                href="https://web.archive.org/web/20090604133254/http://www.truste.org/ivalidate.php?url=www.roblox.com&amp;sealid=105"
            >

                <img
                    src="images/truste_seal_kids.gif"
                    border="0"
                />

            </a>

        </div>

    </div>


    <!--
    ============================================================
    ADVERTISEMENT UNDER THE GAMES SECTION
    ============================================================
    -->

    <div class="FrontPagePanel" id="FrontPageBannerAd">

        <div style="overflow:hidden;">

            <?php if ($activeAdBanner) { ?>

                <a
                    href="<?php echo htmlspecialchars($activeAdBanner['link'], ENT_QUOTES, 'UTF-8'); ?>"
                    target="_blank"
                >

                    <img
                        src="<?php echo htmlspecialchars($activeAdBanner['image'], ENT_QUOTES, 'UTF-8'); ?>"
                        title="<?php echo htmlspecialchars($activeAdBanner['title'], ENT_QUOTES, 'UTF-8'); ?>"
                        alt="<?php echo htmlspecialchars($activeAdBanner['title'], ENT_QUOTES, 'UTF-8'); ?>"
                        border="0"
                        width="728"
                        height="90"
                        style="display:block;"
                    />

                </a>

            <?php } else { ?>

                <div
                    style="
                        width:728px;
                        height:90px;
                        text-align:center;
                    "
                >
                    No advertisement available.
                </div>

            <?php } ?>


            <a
                class="BadAdButton"
                href="/ads.php"
            >
                [ feedback ]
            </a>

        </div>

    </div>


    <div class="FrontPagePanel" id="NewsFeeder">

        <div
            id="ctl00_cphRoblox_NewsFeed_pRobloxNews"
            class="RobloxNews"
        >

            <div id="RobloxNews">

                <h4
                    style="text-align:center;height:16px;margin:0px 0px 2px 0px;"
                >

                    <a
                        href="https://web.archive.org/web/20090604133254/http://blog.roblox.com/"
                    >

                        <font color="graytext">
                            ROBLOX News
                        </font>

                    </a>

                </h4>

                <table
                    id="ctl00_cphRoblox_NewsFeed_dlNews"
                    cellspacing="0"
                    cellpadding="1"
                    border="0"
                    width="158"
                >

                    <tr>
                        <td align="left">
                            <li style="margin-left:1px;">
                                <a href="https://web.archive.org/web/20090604133254/http://blog.roblox.com/?p=987">
                                    Getting it in Gear
                                </a>
                            </li>
                        </td>
                    </tr>

                    <tr>
                        <td align="left">
                            <li style="margin-left:1px;">
                                <a href="https://web.archive.org/web/20090604133254/http://blog.roblox.com/?p=967">
                                    Ninja Vs. Gladiator
                                </a>
                            </li>
                        </td>
                    </tr>

                    <tr>
                        <td align="left">
                            <li style="margin-left:1px;">
                                <a href="https://web.archive.org/web/20090604133254/http://blog.roblox.com/?p=961">
                                    ROBLOX Trailer Video Contest
                                </a>
                            </li>
                        </td>
                    </tr>

                    <tr>
                        <td align="left">
                            <li style="margin-left:1px;">
                                <a href="https://web.archive.org/web/20090604133254/http://blog.roblox.com/?p=955">
                                    Get to the Choppa!
                                </a>
                            </li>
                        </td>
                    </tr>

                </table>

            </div>

        </div>

    </div>

</div>


<?php include __DIR__ . "/Config/Footer.php"; ?>