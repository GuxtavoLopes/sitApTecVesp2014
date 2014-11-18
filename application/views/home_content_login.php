<!-- Content -->
<div id="content">
    <div class="inner">

        <!-- Post -->
        <article class="box post post-excerpt">
            <header>
                <!--
                        Note: Titles and subtitles will wrap automatically when necessary, so don't worry
                        if they get too long. You can also remove the <p> entirely if you don't
                        need a subtitle.
                -->
                <h2><a href="#">Tela de Login</a></h2>
                <p>Se junte ao nosso Site !! O Site que Você Precisa.</p>
            </header>
            <div class="info">
                <!--
                        Note: The date should be formatted exactly as it's shown below. In particular, the
                        "least significant" characters of the month should be encapsulated in a <span>
                        element to denote what gets dropped in 1200px mode (eg. the "uary" in "January").
                        Oh, and if you don't need a date for a particular page or post you can simply delete
                        the entire "date" element.
                        
                -->
                <span class="date"><span class="month">Jul<span>y</span></span> <span class="day">14</span><span class="year">, 2014</span></span>
                <!--
                        Note: You can change the number of list items in "stats" to whatever you want.
                -->
                <ul class="stats">
                    <li><a href="#" class="icon fa-comment">16</a></li>
                    <li><a href="#" class="icon fa-heart">32</a></li>
                    <li><a href="#" class="icon fa-twitter">64</a></li>
                    <li><a href="#" class="icon fa-facebook">128</a></li>
                </ul>
            </div>
            
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


        </article>



    </div>
</div>