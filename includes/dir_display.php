<div class="wrapper container">
    <div class="row">
        <h2 class="text-center"><?php echo $page_title ?></h2>
            <?php
                $dir    = getcwd();
                $files1 = scandir($dir);

                echo "<pre>";
                echo "Directory: " .$dir ."\n";
                echo "<br>";
                print_r($files1);
                echo "</pre>";
                echo "<ul>";
                foreach($files1 as $list){
                    echo "<li><a href='".$list."' target='_blank'>".$list."</a></li>";
                }
                echo "<ul>";
            ?>
    </div>
</div>