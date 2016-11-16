<?php 

  
  $current_user = wp_get_current_user();
  $process_complete = false;
  $is_logged_in = $current_user->exists();
  $current_user_is_designer = $is_logged_in ? get_user_meta($current_user->ID, '_edb_user_is_designer', true ) : false;
  
  $request_method = $_SERVER['REQUEST_METHOD'];
  
  
  $designer_name = isset($_REQUEST['designer']) && isset($_REQUEST['designer']['name']) ? $_REQUEST['designer']['name'] : ''; 
  $designer_email = isset($_REQUEST['designer']) && isset($_REQUEST['designer']['email']) ? $_REQUEST['designer']['email'] : $current_user->user_email ;
  $designer_password = isset($_REQUEST['designer']) && isset($_REQUEST['designer']['password']) ? $_REQUEST['designer']['password'] : '';
  $designer_password_confirmation = isset($_REQUEST['designer']) && isset($_REQUEST['designer']['password_confirmation']) ? $_REQUEST['designer']['password_confirmation'] : '';
  $company_name = isset($_REQUEST['company']) && isset($_REQUEST['company']['name']) ? $_REQUEST['company']['name'] : '';
  $company_foa = isset($_REQUEST['company']) && isset($_REQUEST['company']['foa']) ? $_REQUEST['company']['foa'] : '' ;
  $company_website = isset($_REQUEST['company']) && isset($_REQUEST['company']['website']) ? $_REQUEST['company']['website'] : '' ;

  $passwords_match = $designer_password == $designer_password_confirmation;
  
  if(!empty($company_website)){
    $company_website =  preg_replace('#^https?://#', '', $company_website);
    $company_website = "https://$company_website";
  }
  $errors =  array();
  if( $request_method == 'POST'){
    if(!wp_verify_nonce( $_REQUEST['_wpnonce'], 'register_new_designer' )){
      $errors[] = __('Sorry, an unknown error occured.', 'edb');
    }
    if(!$is_logged_in && empty($designer_name)){
      $errors[] = __('You must fill out the "name" field.', 'edb');
    }
    if(empty($designer_email)){
      $errors[] = __('You must fill out the "email" field.', 'edb');
    }
    if(empty($designer_password)){
      $errors[] = __('You must fill out the "password" field.', 'edb');
    }
    if(!$is_logged_in && empty($designer_password_confirmation)){
      $errors[] = __('You must fill out the "password confirmation" field.', 'edb');
    }
    if(!$is_logged_in && ($designer_password != $designer_password_confirmation)){
      $errors[] = __('Passwords do not match.', 'edb');
    }
    
    if(empty($company_name)){
      $errors[] = __('You must fill out the "company name" field.', 'edb');
    }
    
    if(count($errors) == 0){
      if($is_logged_in){
        $user_id = $current_user->ID;
      }else{
        $userdata = array(
          'user_login'  =>  $designer_email,
          'display_name'  =>  $designer_name,
          'user_email' => $designer_email,
          'user_pass'   =>  $designer_password
        );
        $user_id = wp_insert_user( $userdata );
      }
      
      if ( is_wp_error( $user_id ) ) {
        $errors[] = $user_id->get_error_message();
      }else{
        if(!$is_logged_in){
          $creds = array(
           'user_login'    => $designer_email,
           'user_password' => $designer_password,
           'role' => 'Customer',
           'remember'      => true
          );
          $user = wp_signon( $creds, false );
        }else{
          $user = $current_user;
        }
       
       if ( is_wp_error( $user ) ) {
          $errors[] = $user->get_error_message();
       }else{
         update_user_meta( absint($user->ID), '_edb_user_is_designer', 1 );
         update_user_meta( absint($user->ID), '_edb_designer_level', 'vip' );
         
         if(!empty($company_name)){
           update_user_meta( absint($user->ID), 'company_name', $company_name );
         }
         if(!empty($company_foa)){
           update_user_meta( absint($user->ID), 'company_foa', $company_foa );  
         }
         if(!empty($company_website)){
           update_user_meta( absint($user->ID), 'company_website', $company_website );  
          }
          if(wp_redirect(get_permalink())){
            exit;
          }
          
       }      
                
                 
        
      }
    }
    
  }
 
get_header(); 
?>


	<div id="primary" class="content-area">
		<main id="main" class="site-main" role="main">
      
      <?php
      while ( have_posts() ) : the_post();

        get_template_part( 'template-parts/content', 'page' );


      endwhile; // End of the loop.
      ?>
     <?php if($is_logged_in){
       if($current_user_is_designer){
        ?><p class="form-message success-message"><?php printf(__("Thank you! %s is registered as a designer!", 'edb'), "<b>$designer_email</b>" ); ?></p><?php 
       }else{
         ob_start();
         ?><div class="field">
             <p class="note"><?php printf(__('You are already logged in as %s', 'edb'), "<b>$designer_email</b>" ); ?></p>
           </div>
          <?php
        $login_form = ob_get_clean();
       }
      }else{
        ob_start();
        ?>
        <div class="field">
            <div class="label"><?php _e('Name', 'edb'); ?></div>
            <div class="control">
              
              <input required placeholder="<?php _e('Name', 'edb'); ?>" name="designer[name]" type="text" value="<?php echo $designer_name; ?>">
             </div>
          </div>  
          <div class="field">
            <div class="label"><?php _e('email', 'edb'); ?></div>
            <div class="control"><input required placeholder="<?php _e('Email', 'edb'); ?>" name="designer[email]" type="email" value="<?php echo $designer_email; ?>"></div>
          </div>  
          
                <div class="field">
                  <div class="label"><?php _e('Password', 'edb'); ?></div>
                  <div class="control"><input required placeholder="<?php _e('Password', 'edb'); ?>" name="designer[password]" type="password"></div>
                </div>  
                
                <div class="field">
                  <div class="label"><?php _e('Password Confirmation', 'edb'); ?></div>
                  <div class="control"><input required placeholder="<?php _e('Password Confirmation', 'edb'); ?>" name="designer[password_confirmation]" type="password"></div>
                </div>  
        
        <?php
        $login_form = ob_get_clean();
      } ?>
       
       <?php if(!$current_user_is_designer){ ?>
       <form id="register-designer" method="POST">
         
           <?php if(count($errors) > 0){ ?>
           <div class="errors-section">
            <?php foreach($errors as $error){ ?>
              <p class="form-error"><?php echo $error; ?></p>
            <?php }; ?>
            </div>
           <?php }; ?>
         
         <div class="field-section">
           
            <div class="field-group">
             
               <div class="field">
                 <div class="label"><?php _e('Company Name', 'edb'); ?></div>
                 <div class="control"><input required placeholder="<?php _e('Company Name', 'edb'); ?>" value="<?php echo $company_name; ?>" name="company[name]" type="text"></div>
               </div>  
               

               <div class="field">
                 <div class="label"><?php _e('Website', 'edb'); ?></div>
                 <div class="control"><input placeholder="<?php _e('Website', 'edb'); ?>" name="company[website]" value="<?php echo $company_website; ?>" type="url"></div>
               </div>  
            </div>
           </div>
           <div class="field-section">
             <div class="field-group">
               <?php echo $login_form; ?>
             </div>
           </div>
            
           <div class="buttons-section">
             <?php if(!is_user_logged_in()){ ?>
              <button type="submit" name="create" value="register"><?php _e('register as designer', 'edb'); ?></button>
             <?php }else{ ?>
              <button type="submit" name="create" value="confirm"><?php _e('register as designer', 'edb'); ?></button>
             <?php };?>
           </div>
           <?php wp_nonce_field( 'register_new_designer' ); ?>
       </form>
       <?php }; ?>
      

		</main><!-- #main -->
	</div><!-- #primary -->

<?php
get_sidebar();
get_footer();
