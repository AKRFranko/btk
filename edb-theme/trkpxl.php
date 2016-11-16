<?php

function trkpxl(){
  $path = parse_url($_SERVER['REQUEST_URI'], PHP_URL_PATH);
  $src = '';
  if(preg_match('/\Wproduct-category\W/',$path)){
    $src = "//rtb.adgrx.com/segments/BHiNrGo2BLCybLqmWSnxAMkvVd8phKExY-6Nwjgsrbs=/24527.gif";
  }else if(preg_match('/\Wlookbook\W/',$path)){
    $src = "//rtb.adgrx.com/segments/eiOU1fAMpqNaZo7oile1ftJWEFYz4piApnW0t0glXMY=/24528.gif";
  }else if(preg_match('/\Wcontact-us\W/',$path)){
    $src = "//rtb.adgrx.com/segments/GPzmAKFYVms0fBPVjrFOVMoPG3zHn4VDXCt0uvbxrDU=/24529.gif";
  }else if(preg_match('/\Worder-samples\W/',$path)){
    $src = "//rtb.adgrx.com/segments/BWnlyVYubJ_mA1-F-YcX7C1LQmlWYuAuJpMVvl_hjjE=/24530.gif";
  }else if(preg_match('/\Wcart\W/',$path)){
    $src = "//rtb.adgrx.com/segments/bvN4A9-4R0XBOzUzNIUKS_Fcysfjnm1F2ikWqHcRH9s=/24531.gif";
  }else if(preg_match('/\Worder-received\W/',$path)){
    $src = "//rtb.adgrx.com/segments/nQPpcR0nIr47SRo-ubO9dgN5V5XmMeore5V9PDciHEM=/27839.gif";
  }else if(preg_match('/\Wabout-shipping\W/',$path)){
    $src = "//rtb.adgrx.com/segments/SOa2temJyYv1xe6R5CH5me5b-GIocIkyN_EFz635xlU=/24533.gif";
  }else if(preg_match('/\Wabout-return-exchange\W/',$path)){
    $src = "//rtb.adgrx.com/segments/SOa2temJyYv1xe6R5CH5me5b-GIocIkyN_EFz635xlU=/24533.gif";
  }
  if(!empty($src)){
    echo '<img src="'.$src.'" width="1" height="1" border="0" class="trkpxl" />';
  }
}




