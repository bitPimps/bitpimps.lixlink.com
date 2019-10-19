<?php
Header("Content-type: image/jpeg");
$image = ImageCreate(200, 150);
$gray = ImageColorAllocate($image, 204, 204, 204);
$blue = ImageColorAllocate($image, 0, 0, 255);
ImageLine($image, 10, 10, 150, 30, $blue);
ImageJPEG($image);
ImageDestroy($image);
?>