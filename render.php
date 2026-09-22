<?php
require_once "../config/includes.php";
require_once "../Assemblies/Roblox/Grid/Rcc/RCCServiceSoap.php";

$id = filter_input(INPUT_GET, 'ID', FILTER_VALIDATE_INT) 
    ?? filter_input(INPUT_GET, 'id', FILTER_VALIDATE_INT) 
    ?? ($_USER['id'] ?? 1);

try {
    $sql = $db->prepare("SELECT * FROM users WHERE id = :id");
    $sql->bindParam(':id', $id, PDO::PARAM_INT);
    $sql->execute();
    $user = $sql->fetch();

    if (!$user) {
        header("Location: /");
        exit;
    }

    $avatarFilePath = $_SERVER['DOCUMENT_ROOT'] . "/Thumbs/" . $id . ".png";
    $RCCServiceSoap = new RCCServiceSoap();

    // Face
    if ($user['face']) {
        $gladys = $db->prepare("SELECT * FROM items WHERE id = :id AND `type` = 'face'");
        $gladys->execute([":id" => $user['face']]);
        $face = $gladys->fetch();
        $faceGraph = $face ? $face['asset'] : "rbxasset://textures/face.png";
    } else {
       
        $face = '"rbxasset://textures/face.png"';

    }

    // Shirt
    if ($user['shirt']) {
        $gladys2 = $db->prepare("SELECT * FROM items WHERE id = :id AND `type` = 'shirt'");
        $gladys2->execute([":id" => $user['shirt']]);
        $shirt = $gladys2->fetch();
        $shirtGraph = $shirt ? htmlspecialchars($shirt['asset']) : "";
    } else {
        $shirtGraph = "";
    }

    // Pants
    if ($user['pant']) {
        $gladys3 = $db->prepare("SELECT * FROM items WHERE id = :id AND `type` = 'pant'");
        $gladys3->execute([":id" => $user['pant']]);
        $pant = $gladys3->fetch();
        $pantGraph = $pant ? htmlspecialchars($pant['asset']) : "";
    } else {
        $pantGraph = "";
    }

    // T-Shirt
    if ($user['tshirt']) {
        $gladys4 = $db->prepare("SELECT * FROM items WHERE id = :id AND `type` = 'tshirt'");
        $gladys4->execute([":id" => $user['tshirt']]);
        $tshirtt = $gladys4->fetch();
        $tshirtGraph = $tshirtt ? htmlspecialchars($tshirtt['asset']) : "";
    } else {
        $tshirtGraph = "";
    }

    $headColor = '"' . $user['HeadColor'] . '"';
    $leftArmColor = '"' . $user['LeftArmColor'] . '"';
    $rightArmColor = '"' . $user['RightArmColor'] . '"';
    $leftLegColor = '"' . $user['LeftLegColor'] . '"';
    $rightLegColor = '"' . $user['RightLegColor'] . '"';
    $torsoColor = '"' . $user['TorsoColor'] . '"';
    $face = '"' . $faceGraph . '"';
    $shirt = '"' . $shirtGraph . '"';
    $pants = '"' . $pantGraph . '"';
    $tShirt = '"' . $tshirtGraph . '"';

    $hat1 = $user['hat1'];
    $hat2 = $user['hat2'];
    $hat3 = $user['hat3'];
    $hat1scr = $hat2scr = $hat3scr = "";

    if ($hat1 != 0) {
        $hat1sql = $db->prepare("SELECT asset FROM items WHERE id = :id AND `type` = 'hat'");
        $hat1sql->execute(["id" => $hat1]);
        $hat1aid = $hat1sql->fetch();
        if ($hat1aid && isset($hat1aid['asset'])) {
            $hat1asset = $hat1aid['asset'];
            $hat1scr = "
local Hat1 = game:GetObjects('" . $hat1asset . "')[1]
Hat1.Parent = game.Players.LocalPlayer.Character
";
        }
    }

    if ($hat2 != 0) {
        $hat2sql = $db->prepare("SELECT asset FROM items WHERE id = :id AND `type` = 'hat'");
        $hat2sql->execute(["id" => $hat2]);
        $hat2aid = $hat2sql->fetch();
        if ($hat2aid && isset($hat2aid['asset'])) {
            $hat2asset = $hat2aid['asset'];
            $hat2scr = "
local Hat2 = game:GetObjects('" . $hat2asset . "')[1]
Hat2.Parent = game.Players.LocalPlayer.Character
";
        }
    }

    if ($hat3 != 0) {
        $hat3sql = $db->prepare("SELECT asset FROM items WHERE id = :id AND `type` = 'hat'");
        $hat3sql->execute(["id" => $hat3]);
        $hat3aid = $hat3sql->fetch();
        if ($hat3aid && isset($hat3aid['asset'])) {
            $hat3asset = $hat3aid['asset'];
            $hat3scr = "
local Hat3 = game:GetObjects('" . $hat3asset . "')[1]
Hat3.Parent = game.Players.LocalPlayer.Character
";
        }
    }

    $thumbnailScript = <<<LUA
player = game:GetService("Players"):CreateLocalPlayer(0)
player:LoadCharacter(0)

local char = player.Character or player.CharacterAdded:Wait()
local head = char.Head

if head then
    local face = head.face
    if not face then
        face = Instance.new("Decal")
        face.Name = "face"
        face.Parent = head
    end
    face.Texture = $face
end

shirt = Instance.new("Shirt", player.Character)
shirt.ShirtTemplate = $shirt

tShirt = Instance.new("ShirtGraphic", player.Character)
tShirt.Graphic = $tShirt

pants = Instance.new("Pants", player.Character)
pants.PantsTemplate = $pants

bodyColors = Instance.new("BodyColors", player.Character)
bodyColors.HeadColor = BrickColor.new($headColor)
bodyColors.LeftArmColor = BrickColor.new($leftArmColor)
bodyColors.RightArmColor = BrickColor.new($rightArmColor)
bodyColors.LeftLegColor = BrickColor.new($leftLegColor)
bodyColors.RightLegColor = BrickColor.new($rightLegColor)
bodyColors.TorsoColor = BrickColor.new($torsoColor)

$hat1scr
$hat2scr
$hat3scr

return game:GetService("ThumbnailGenerator"):Click("PNG", 400, 400, true)
LUA;

    $render = $RCCServiceSoap->execScript($thumbnailScript, rand(1, getrandmax()), 120);
    $fallbackUrl = $_SERVER['DOCUMENT_ROOT'] . '/images/noob2stips.png';

    if (empty($render)) {
        $render = file_get_contents($fallbackUrl);
        $render = base64_encode($render);
    }

    file_put_contents($avatarFilePath, base64_decode($render));

    header("Location: /My/Character.aspx");
    exit;

} catch (PDOException $e) {
    error_log("Database Error: " . $e->getMessage());
    header("Location: /My/Character.aspx");
    exit;
} catch (Exception $e) {
    error_log("General Error: " . $e->getMessage());
    header("Location: /My/Character.aspx");
    exit;
}
?>