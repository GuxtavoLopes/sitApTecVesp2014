<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
 <head>
   <title>Sistema de Login</title>
 </head>
 <body>
   <h1>Sistema de Login</h1>
   <?php echo validation_errors(); ?>
   <?php echo form_open('verifylogin'); ?>
     <label for="nome">Nome:</label>
     <input type="text" size="20" id="username" name="nome"/>
     <br/>
     <label for="senha">Senha:</label>
     <input type="password" size="20" id="passowrd" name="senha"/>
     <br/>
     <input type="submit" value="Login"/>
   </form>
   <a href="<?php echo base_url('usuarios/inserir'); ?>">Cadastrar </a>
 </body>
</html>