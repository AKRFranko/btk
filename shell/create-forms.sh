#! /bin/sh
cd /home/franko/Code/edb.com/btk




MAIL='{"recipient":"franko@akr.club","subject":"[your-subject]","sender":"[your-email]","body":"[your-message]","additional_headers":"","attachments":"","use_html":false,"exclude_blank":false}'
MAIL_2='{"active":false,"subject":"","sender":"","body":"","recipient":"","additional_headers":"","attachments":"","use_html":false,"exclude_blank":false}'
FORM='<p>Your Name (required)<br />[text* your-name] </p><p>Your Email (required)<br />[email* your-email] </p><p>Your Postal Code [text* potsal-code id:postal-code class:postal-code]<p>[submit "Send"]</p>'
MESSAGES='{"mail_sent_ok":"Your message was sent successfully. Thanks.","mail_sent_ng":"Failed to send your message. Please try later or contact the administrator by another method.","validation_error":"Validation errors occurred. Please confirm the fields and submit again.","spam":"Failed to send your message. Please try later or contact the administrator by another method.","accept_terms":"Please accept the terms to proceed.","invalid_required":"Please fill in the required field.","invalid_too_long":"This input is too long.","invalid_too_short":"This input is too short.","invalid_date":"Date format seems invalid.","date_too_early":"This date is too early.","date_too_late":"This date is too late.","upload_failed":"Failed to upload file.","upload_file_type_invalid":"This file type is not allowed.","upload_file_too_large":"This file is too large.","upload_failed_php_error":"Failed to upload file. An error occurred.","invalid_number":"Number format seems invalid.","number_too_small":"This number is too small.","number_too_large":"This number is too large.","quiz_answer_not_correct":"Your answer is not correct.","captcha_not_match":"Your entered code is incorrect.","invalid_email":"Email address seems invalid.","invalid_url":"URL seems invalid.","invalid_tel":"Telephone number seems invalid."}'

CONTEST_FORM_FORM='<p>[text* your-name placeholder "your name"] </p> <p>[email* your-email placeholder "your email"] </p> <p>[text* postal-code id:postal-code class:postal-code placeholder "postal code"]</p> <p>[submit "Send"]</p>'
CONTEST_FORM_MAIL='{"recipient":"info@elementdebase.com","subject":"CONTEST ENTRY","sender":"[your-name] <robots@elementdebase.com>","body":"[your-name] ( [your-email] ) I want to enter the contest! postal code: [postal-code]","additional_headers":"Reply-To: [your-email]","attachments":"","use_html":false,"exclude_blank":false}'


CONTACT_FORM_FORM='<h3>Write To Us</h3><p>[text* your-name placeholder "your name"] </p> <p>[email* your-email placeholder "your email"] </p> <p>[text your-subject placeholder "subject"] </p> <p>Your Message<br/><br />   [textarea your-message] </p> <p>[submit "Send"]</p>'
CONTACT_FORM_MAIL='{"recipient":"info@elementdebase.com","subject":"[your-subject]","sender":"[your-name] <robots@elementdebase.com>","body":"[your-message]","additional_headers":"Reply-To: [your-email]","attachments":"","use_html":false,"exclude_blank":false}'


SAMPLES_FORM_FORM='<div class="half"><p>[text* your-name placeholder "your name"] </p> <p>[email* your-email placeholder "your email"] </p> <p>[text* street-address id:street-address class:street-address placeholder "your street address"]</p> </div><div class="half"><p>[select* province id:province class:province "Alberta" "British Columbia" "Manitoba" "New Brunswick" "Newfoundland and Labrador" "Northwest Territories" "Nova Scotia" "Nunavut" "Ontario" "Prince Edward Island" "Quebec" "Saskatchewan" "Yukon Territory"]</p> <p>[text* city id:city class:city placeholder = "your city"]</p> <p>[text* postal-code id:postal-code class:postal-code placeholder "your postal code"] </div><p>[submit "Send"]</p>'
SAMPLES_FORM_MAIL='{"recipient":"info@elementdebase.com","subject":"GIMME SAMPLES","sender":"[your-name] <robots@elementdebase.com>","body":"[your-name] ( [your-email] )[street-address] [province], [city] [postal-code]","additional_headers":"Reply-To: [your-email]","attachments":"","use_html":false,"exclude_blank":false}'

CONTEST_FORM_ID=`wp post create --post_type=wpcf7_contact_form --post_title="Contest #1" --post_content="$CONTEST_FORM_FORM" --porcelain`
CONTACT_FORM_ID=`wp post create --post_type=wpcf7_contact_form --post_title="Contact Us" --post_content="$CONTACT_FORM_FORM" --porcelain`
SAMPLES_FORM_ID=`wp post create --post_type=wpcf7_contact_form --post_title="Order Samples" --post_content="$SAMPLES_FORMFORM" --porcelain`

echo "wp post meta update $CONTEST_FORM_ID _form '$CONTEST_FORM_FORM'" | sh
echo "wp post meta update $CONTEST_FORM_ID _mail '$CONTEST_FORM_MAIL' --format=json" | sh
echo "wp post meta update $CONTEST_FORM_ID _mail_2 '$MAIL_2' --format=json" | sh

echo "wp post meta update $CONTACT_FORM_ID _form '$CONTACT_FORM_FORM'" | sh
echo "wp post meta update $CONTACT_FORM_ID _mail '$CONTACT_FORM_MAIL' --format=json" | sh
echo "wp post meta update $CONTACT_FORM_ID _mail_2 '$MAIL_2' --format=json" | sh

echo "wp post meta update $SAMPLES_FORM_ID _form '$SAMPLES_FORM_FORM'" | sh
echo "wp post meta update $SAMPLES_FORM_ID _mail '$SAMPLES_FORM_MAIL' --format=json" | sh
echo "wp post meta update $SAMPLES_FORM_ID _mail_2 '$MAIL_2' --format=json" | sh

CONTACT_PAGE="<div class=\"half\"><h3>Address</h3><p class=\"contact-address\">534 McCaffrey<br />Montreal, Qc<br />H4T 1N1</p><p class=\"contact-more\">514-775-9948<br />1-800-775-9948<br /><a href=\"mailto:info@elementdebase.com\">info@elementdebase.com</a></p></div><div class=\"half\"><h3>Opening Hours</h3><dl><dt>mon - wed</dt><dd>11H00 to 18H00</dd><dt>jeu - ven</dt><dd>11H00 to 21H00</dd><dt>sam - dim</dt><dd>12H00 to 17H00</dd></dl></div><div class=\"full\" id=\"artsy-map\"></div><div class=\"half\"><a class=\"real-map\" href=\"https://goo.gl/maps/cSqYKv1WnuB2\"><img width=\"600\" src=\"https://maps.googleapis.com/maps/api/staticmap?autoscale=false&size=600x600&maptype=roadmap&format=png&visual_refresh=true&markers=size:mid%7Ccolor:0x000000%7Clabel:E%7C534+McCafrey,+Montreal,+Qc\" alt=\"Element De Base\"></a></div><div class=\"half\">[contact-form-7 id=\"$CONTACT_FORM_ID\" title=\"Contact US\"]</div>"
CONTEST_PAGE="<p>Enter for a chance to win this amazing stack of cussions and this beautiful ottoman![contact-form-7 id=\"$CONTEST_FORM_ID\" title=\"Contest\"]<div class=\"btk-form-success inplace\"><h3>Alright!</h3><p>Your order is sent, Donec pulvinar non mauris iaculis congue. Maecenas volutpat mattis varius. Mauris at erat commodo, viverra dolor vel, lobortis velit. Aliquam vitae dolor cursus, sollicitudin dui et, euismod dui. Pellentesque dapibus mattis velit, vel commodo nisi finibus ac. Pellentesque id sollicitudin leo.</p></div>"
SAMPLES_PAGE="<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec tristique quam sit amet tellus volutpat pretium. Integer mollis tristique porta. Duis pretium sapien mattis elit eleifend hendrerit. Maecenas eu elementum dui.</p><p>[contact-form-7 id=\"$SAMPLES_FORM_ID\" title=\"Order Samples\"]<div class=\"btk-form-success\"><a class=\"close\" href=\"#\">close</a><br /><h3>Alright!</h3><p>Your order is sent, Donec pulvinar non mauris iaculis congue. Maecenas volutpat mattis varius. Mauris at erat commodo, viverra dolor vel, lobortis velit. Aliquam vitae dolor cursus, sollicitudin dui et, euismod dui. Pellentesque dapibus mattis velit, vel commodo nisi finibus ac. Pellentesque id sollicitudin leo.</p><p><img src=\"https://development.elementdebase.com/wp-content/uploads/2015/12/ordersamples.jpg\"></div>"

echo "wp post create --post_type=page --post_title='Contact Us (test)' --post_content='$CONTACT_PAGE' --post_status=draft" | sh
echo "wp post create --post_type=page --post_title='Contest (test)' --post_content='$CONTEST_PAGE' --post_status=draft" | sh
echo "wp post create --post_type=page --post_title='Order Samples (test)' --post_content='$SAMPLES_PAGE' --post_status=draft" | sh