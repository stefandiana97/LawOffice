<!DOCTYPE html>

<?php

include "connect.php";
		
			if (isset($_POST['cautare1'])) 
			{
				$result="call interogarea3b";
				$rezultate_cautare = $db->query($result);
					
			}
			else {
				$result="SELECT * FROM contract_m";
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
      <li><a href="#">Interogarea 3</a></li>
      <li><a href="#">Interogarea 3b</a></li>
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
          <header class="heading" align="center">Sa se gaseasca detaliile contractelor de munca in ordine descrescatoare a salariului de baza pentru contractele de munca ce au comision.</header>
		  
			<form action="" method="post" >
				<br>
				<ul class="nospace inline pushright">
				<li><input type="submit" name="cautare1" value="Afiseaza &raquo;" class="btn"></li>
				<li><input type="submit" name="cautare2" value="Afiseaza Tot &raquo;" class="btn"></li>
				</ul>
				<br>
			<table border="1" align="center" >
			
					<tr align="center">
						<th>ID_CM</th>
						<th>DATA</th>
						<th>FUNCTIE</th>
						<th>SALAR_BAZA</th>
						<th>COMISION</th>
						<th>ID_ANGAJAT</th>
					</tr>
					
					<?php
					while($row=mysqli_fetch_array($rezultate_cautare)):?>
					<tr align="center">
						<td><?php echo $row['id_cm'];?></td>
						<td><?php echo $row['data'];?></td>
						<td><?php echo $row['functie'];?></td>
						<td><?php echo $row['salar_baza'];?></td>
						<td><?php if($row['comision']!=NULL ) echo $row['comision']; else echo "NULL"; ?></td>
						<td><?php echo $row['id_angajat'];?></td>
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