<?php
// Allow for manual image selection
if (isset($imgType))
{
  if ($imgType == "one")
    $hpImg = 1;
  elseif($imgType == "two")
    $hpImg = 2;
  elseif($imgType == "three")
    $hpImg = 3;
  elseif($imgType == "four")
    $hpImg = 4;
	elseif($imgType == "five")
		$hpImg = 5;
	elseif($imgType == "six")
		$hpImg = 6;
	elseif($imgType == "seven")
		$hpImg = 7;
	elseif($imgType == "eight")
		$hpImg = 8;
	elseif($imgType == "nine")
		$hpImg = 9;
	elseif($imgType == "ten")
		$hpImg = 10;
	elseif($imgType == "eleven")
		$hpImg = 11;
	elseif($imgType == "twelve")
		$hpImg = 12;
	elseif($imgType == "thirteen")
		$hpImg = 13;
	elseif($imgType == "fourteen")
		$hpImg = 14;
	elseif($imgType == "fifteen")
		$hpImg = 15;
	elseif($imgType == "sixteen")
		$hpImg = 16;
	elseif($imgType == "seventeen")
		$hpImg = 17;
	elseif($imgType == "eighteen")
		$hpImg = 18;
	elseif($imgType == "nineteen")
		$hpImg = 19;
	elseif($imgType == "twenty")
		$hpImg = 20;
	elseif($imgType == "twentyone")
		$hpImg = 21;
	elseif($imgType == "twentytwo")
		$hpImg = 22;
	elseif($imgType == "twentythree")
		$hpImg = 23;
	elseif($imgType == "twentyfour")
		$hpImg = 24;
	elseif($imgType == "twentyfive")
		$hpImg = 25;
	elseif($imgType == "twentysix")
		$hpImg = 26;
	elseif($imgType == "twentyseven")
		$hpImg = 27;
	elseif($imgType == "twentyeight")
		$hpImg = 28;
	elseif($imgType == "twentynine")
		$hpImg = 29;
	elseif($imgType == "thirty")
		$hpImg = 30;
	elseif($imgType == "thirtyone")
		$hpImg = 31;
	elseif($imgType == "thirtytwo")
		$hpImg = 32;
	elseif($imgType == "thirtythree")
		$hpImg = 33;
	elseif($imgType == "thirtyfour")
		$hpImg = 34;
	elseif($imgType == "thirtyfive")
		$hpImg = 35;
	elseif($imgType == "thirtysix")
		$hpImg = 36;
	elseif($imgType == "thirtyseven")
		$hpImg = 37;
	elseif($imgType == "thirtyeight")
		$hpImg = 38;
	elseif($imgType == "thirtynine")
		$hpImg = 39;
	elseif($imgType == "forty")
		$hpImg = 40;
	elseif($imgType == "fortyone")
		$hpImg = 41;
	elseif($imgType == "fortytwo")
		$hpImg = 42;
	elseif($imgType == "fortythree")
		$hpImg = 43;
	elseif($imgType == "fortyfour")
		$hpImg = 44;
	elseif($imgType == "fortyfive")
		$hpImg = 45;
	elseif($imgType == "fortysix")
		$hpImg = 46;
}

// Generate random image if needed 
if (!isset($hpImg))
{
  mt_srand ((double) microtime() * 1000000);
  $hpImg = mt_rand(1,46);
}

 if ($hpImg == 1)
 {
    $imgName = "multishot00";
	}
  elseif($hpImg == 2)
	{
    $imgName = "multishot01";
	}
  elseif($hpImg == 3)
	{
    $imgName = "multishot02";
	}
  elseif($hpImg == 4)
	{
    $imgName = "action00";
	}
	elseif($hpImg == 5)
	{
		$imgName = "action01";
	}
	elseif($hpImg == 6)
	{
		$imgName = "action02";
	}
	elseif($hpImg == 7)
	{
		$imgName = "chicks00";
	}
	elseif($hpImg == 8)
	{
		$imgName = "homies00";
	}
	elseif($hpImg == 9)
	{
		$imgName = "pose00";
	}
	elseif($hpImg == 10)
	{
		$imgName = "boombox00";
	}
	elseif($hpImg == 11)
	{
		$imgName = "pimpbus00";
	}
	elseif($hpImg == 12)
	{
		$imgName = "bitpimps00";
	}
	elseif($hpImg == 13)
	{
		$imgName = "multishot04";
	}
	elseif($hpImg == 14)
	{
		$imgName = "multishot05";
	}
	elseif($hpImg == 15)
	{
		$imgName = "multishot06";
	}
	elseif($hpImg == 16)
	{
		$imgName = "multishot07";
	}
	elseif($hpImg == 17)
	{
		$imgName = "multishot08";
	}
	elseif($hpImg == 18)
	{
		$imgName = "multishot09";
	}
	elseif($hpImg == 19)
	{
		$imgName = "multishot10";
	}
	elseif($hpImg == 20)
	{
		$imgName = "multishot11";
	}
	elseif($hpImg == 21)
	{
		$imgName = "multishot12";
	}
	elseif($hpImg == 22)
	{
		$imgName = "multishot13";
	}
	elseif($hpImg == 23)
	{
		$imgName = "multishot14";
	}
	elseif($hpImg == 24)
	{
		$imgName = "multishot15";
	}
	elseif($hpImg == 25)
	{
		$imgName = "multishot16";
	}
	elseif($hpImg == 26)
	{
		$imgName = "multishot17";
	}
	elseif($hpImg == 27)
	{
		$imgName = "multishot18";
	}
	elseif($hpImg == 28)
	{
		$imgName = "multishot19";
	}
	elseif($hpImg == 29)
	{
		$imgName = "multishot20";
	}
	elseif($hpImg == 30)
	{
		$imgName = "multishot21";
	}
	elseif($hpImg == 31)
	{
		$imgName = "multishot22";
	}
	elseif($hpImg == 32)
	{
		$imgName = "multishot23";
	}
	elseif($hpImg == 33)
	{
		$imgName = "multishot24";
	}
	elseif($hpImg == 34)
	{
		$imgName = "multishot25";
	}
	elseif($hpImg == 35)
	{
		$imgName = "multishot26";
	}
	elseif($hpImg == 36)
	{
		$imgName = "multishot27";
	}
	elseif($hpImg == 37)
	{
		$imgName = "multishot28";
	}
	elseif($hpImg == 38)
	{
		$imgName = "multishot29";
	}
	elseif($hpImg == 39)
	{
		$imgName = "multishot30";
	}
	elseif($hpImg == 40)
	{
		$imgName = "multishot31";
	}
	elseif($hpImg == 41)
	{
		$imgName = "multishot32";
	}
	elseif($hpImg == 42)
	{
		$imgName = "multishot33";
	}
	elseif($hpImg == 43)
	{
		$imgName = "multishot34";
	}
	elseif($hpImg == 44)
	{
		$imgName = "multishot35";
	}
	elseif($hpImg == 45)
	{
		$imgName = "multishot36";
	}
	elseif($hpImg == 46)
	{
		$imgName = "multishot37";
	}
?>