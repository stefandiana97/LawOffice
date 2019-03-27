<!DOCTYPE html>

<?php

include "connect.php";
		
		
		if (isset($_POST['cautare1'])) 
			{
				$val_cautat = $_POST['val_cautat'];
				$val_cautat = trim($val_cautat);
				$eroare=0;
				if ($val_cautat==NULL or !is_numeric($val_cautat))
					{
						$val_cautat=0;
						$eroare=1;
					}
					
				$result = "SELECT j.id_cj, j.data, j.obiect, j.onorar, j.nr_pagini, j.id_client, j.id_avocat FROM contract_j j WHERE j.onorar > ALL (SELECT onorar FROM contract_j WHERE id_cj=$val_cautat)";
				
				$rezultate_cautare = $db->query($result);

				$rez="SELECT onorar FROM contract_j WHERE id_cj=$val_cautat";
				$rez_cautare = $db->query($rez);
				$row_1=mysqli_fetch_array($rez_cautare);	
				
			}
			else {
				$eroare=0;
				$result = "SELECT j.id_cj, j.data, j.obiect, j.onorar, j.nr_pagini, j.id_client, j.id_avocat FROM contract_j j";
				$rezultate_cautare = $db->query($result);
			}
			
			
?>


<html lang="">
<head>
<title>Subiectul 14 | Interogarea 3a</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<link href="../layout/styles/layout.css" rel="stylesheet" type="text/css" media="all">
</head>
<body id="top">
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<div class="wrapper row1">
  <header id="header" class="hoc clear"> 
    <!-- ################################################################################################ -->
    <div id="logo" class="fl_left">
      <h1><a href="index.html">Subiectul 14 - Colocviu final de laborator</a></h1>
    </div>
    <div id="quickinfo" class="fl_right">
      <ul class="nospace inline">
        <li><strong>Stefan Florina Diana</strong><br>
          Grupa 30227</li>
      </ul>
    </div>
    <!-- ################################################################################################ -->
  </header>
</div>
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<div class="wrapper row2">
  <nav id="mainav" class="hoc clear"> 
    <!-- ################################################################################################ -->
    <ul class="clear">
      <li class="active"><a href="../index.html">Home</a></li>
      <li><a class="drop" href="#">Interogarea 3</a>
        <ul>
          <li><a href="interogarea3a.php">Interogarea 3a</a></li>
          <li><a href="interogarea3b.php">Interogarea 3b</a></li>
        </ul>
      </li>
      <li><a class="drop" href="#">Interogarea 4</a>
        <ul>
          <li><a href="interogarea4a.php">Interogarea 4a</a></li>
          <li><a href="interogarea4b.php">Interogarea 4b</a></li>
        </ul>
      </li>
	  
	  <li><a class="drop" href="#">Interogarea 5</a>
        <ul>
          <li><a href="interogarea5a.php">Interogarea 5a</a></li>
		  <li><a href="interogarea5b.php">Interogarea 5b</a></li>
        </ul>
      </li>
	  
	  <li><a class="drop" href="#">Interogarea 6</a>
        <ul>
          <li><a href="interogarea6a.php">Interogarea 6a</a></li>
		  <li><a href="interogarea6b.php">Interogarea 6b</a></li>
        </ul>
      </li>
    </ul>
    <!-- ################################################################################################ -->
  </nav>
</div>
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<div class="wrapper bgded overlay" style="background-image:url('../images/demo/backgrounds/j2.png');">
  <div id="breadcrumb" class="hoc clear"> 
    <!-- ################################################################################################ -->
    <ul>
      <li><a href="#">Home</a></li>
      <li><a href="#">Interogarea 5</a></li>
      <li><a href="#">Interogarea 5a</a></li>
    </ul>
    <!-- ################################################################################################ -->
  </div>
</div>
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<div class="wrapper row3">
  <main class="hoc container clear"> 
    <!-- main body -->
    <!-- ################################################################################################ -->
    <div class="content"> 
      <!-- ################################################################################################ -->
      <div id="gallery">
        <figure>
          <header class="heading" align="center">Sa se gaseasca contractele de asistenta juridica cu onorar mai mare decat onorarul contractului juridic cu id_cj:</header>
		 
		  
			<form action="" method="post" >
			<br>
			 <input type="text" name="val_cautat" maxlength="20" size="35" value="123">
				<br>
				
				<ul class="nospace inline pushright">
				<li><input type="submit" name="cautare1" value="Afiseaza &raquo;" class="btn"></li>
				<li><input type="submit" name="cautare2" value="Afiseaza Tot &raquo;" class="btn"></li>
				</ul>
				
				<font size="5" class="heading" align="center">
				<?php
				if ($eroare==1){
					echo ' Eroare la datele introduse!';}
				if($eroare==0 && isset($rez_cautare) && $rez_cautare->num_rows==0)
					echo ' Eroare la datele introduse! A-ti introdus un ID_CJ gresit.';
				?>
				</font></p>
				
				<figcaption><?php if(isset($val_cautat) && $rez_cautare->num_rows!=0) if($val_cautat!=NULL ) printf("Onorarul contractului juridic cu id_cj: %d : %d ",$val_cautat,$row_1['onorar']);?></figcaption>
				<br>
			<table border="1" align="center" >

					<tr align="center">
						<th>ID_CJ</th>
						<th>DATA</th>
						<th>OBIECT</th>
						<th>ONORAR</th>
						<th>NR_PAGINI</th>
						<th>ID_CLIENT</th>
						<th>ID_AVOCAT</th>
					</tr>
					
					<?php
					while($row=mysqli_fetch_array($rezultate_cautare)):?>
					<tr align="center">
						<td><?php echo $row['id_cj'];?></td>
						<td><?php echo $row['data'];?></td>
						<td><?php echo $row['obiect'];?></td>
						<td><?php echo $row['onorar'];?></td>
						<td><?php echo $row['nr_pagini'];?></td>
						<td><?php echo $row['id_client'];?></td>
						<td><?php echo $row['id_avocat'];?></td>
					</tr>
					<?php endwhile;?>
			 </table>
			 
			 </form>
		  
		  
             <ul class="nospace clear">
            <li class="one_quarter first"><a href="#"><img src="../images/demo/gallery/j1.png" alt=""></a></li>
			<li class="one_quarter"><a href="#"><img src="../images/demo/gallery/j2.png" alt=""></a></li>
            <li class="one_quarter"><a href="#"><img src="../images/demo/gallery/j5.png" alt=""></a></li>
            <li class="one_quarter"><a href="#"><img src="../images/demo/gallery/j4.png" alt=""></a></li>
             </ul>
          <figcaption><?php printf("Numar de contracte gasite: %d ",$rezultate_cautare->num_rows);?></figcaption>
        </figure>
      </div>
      <!-- ################################################################################################ -->
      <!-- ################################################################################################ -->
      <!-- ################################################################################################ -->
    </div>
    <!-- ################################################################################################ -->
    <!-- / main body -->
    <div class="clear"></div>
  </main>
</div>
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<div class="wrapper row5">
  <div id="copyright" class="hoc clear"> 
    <!-- ################################################################################################ -->
    <p class="fl_left">Copyright &copy; 2018 - All Rights Reserved</p>
    <p class="fl_right"><a target="_blank" title="Templates">Stefan Florina Diana</a></p>
    <!-- ################################################################################################ -->
  </div>
</div>
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<a id="backtotop" href="#top"><i class="fa fa-chevron-up"></i></a>
<!-- JAVASCRIPTS -->
<script src="../layout/scripts/jquery.min.js"></script>
<script src="../layout/scripts/jquery.backtotop.js"></script>
<script src="../layout/scripts/jquery.mobilemenu.js"></script>
</body>
</html>