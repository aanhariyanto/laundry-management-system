<?php
    $this->load->helper("az_core");
    $this->load->helper('az_config');
?>
<!DOCTYPE html>
<html>
    <head>
    	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
        <link rel="shortcut icon" href="<?php echo base_url().AZAPP.'assets/images/logo.png';?>" />
        <title><?php echo az_get_config('app_name');?></title>
        <script type="text/javascript">
            var base_url = "<?php echo base_url();?>"; 
            var app_url = "<?php echo app_url();?>";
        </script>
        <style type="text/css">
            .txt-info-login {
                font-size: 12px;
            }
        </style>
	</head>
	<body style="width:100%;overflow-x:hidden;" class="container-body-login">
        <div class="row">
            <div class="col-md-4"></div>
            <div class="col-md-4">
                <div class="login-container">
                    <div class="box-login-wrapper">
                        <div class="box-login">
                            <img width="100px" src="<?php echo base_url().AZAPP;?>assets/images/logo.png">
                            <h5><?php echo az_get_config('app_login_title');?></h5>
                            
                            <form method="POST" action="login/process">
                                <?php 
                                    $err_login = $this->session->flashdata("error_login");
                                    if (strlen($err_login) > 0) {
                                        echo "<div class='login-error-message'>".$err_login."</div>";
                                    }
                                ?>
                                <input type="hidden" name="<?php echo $this->security->get_csrf_token_name();?>" value="<?php echo $this->security->get_csrf_hash();?>">
                                <div class="field-login">
                                    <i class="fa fa-user"></i>
                                    <input type="text" name="username" class="form-control" placeholder="Username">
                                </div>
                                <div class="field-login">
                                    <i class="fa fa-key"></i>
                                    <input type="password" name="password" class="form-control" placeholder="Password">
                                </div>
                                <div class="txt-right">
                                    <button type="submit" class="btn btn-info btn-login">Login</button>
                                </div>
                                <div style="margin-top:15px;">
                                </div>
                                <div style="margin-top:15px;">
                                </div>
                                <div class="login-copyright">
                                  &copy <script>document.write(new Date().getFullYear())</script> <?php echo az_get_config('app_name');?>, Inc.</a>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
        <?php
        	echo az_css();
        	echo az_js();
        ?>
<script type="text/javascript">
    setTimeout(function(){
        jQuery(".login-error-message").hide("slow")
    }, 1000);
</script>