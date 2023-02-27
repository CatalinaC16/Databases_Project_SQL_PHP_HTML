<html>

<head>
	<title>Batalii</title>
	<link rel="stylesheet" type="text/css" href="css/bootstrap.css">
	<style type="text/css">
		body {
			background-color: #B2BABB;
		}
		table {
			font-family:verdana;
			border-color: #008080;
			margin: 0 auto;
		}
		.form-container {
		
			padding-left: 30px;
			padding-top: 20px;
		}
		.text-container{
			
			padding-left: 30px;
			padding-top: 20px;
			
		}

	
		</style>
</head>

<body>	
	<div class="text-container">	
		<p style="color:#315357 ; font-size: 23px; "><strong><em>Tabelul Batalii: </em></strong></p>	
	</div>
	
		<?php

			$mysqli = new mysqli("localhost","root","","clase");

			if ($mysqli->connect_error) {
				die("Connection failed: ".$mysqli->connect_error);
			}

			$sql = "SELECT NUME,DATA,LOCATIE FROM Batalii";
			$result = $mysqli->query($sql);

			echo "<table border='2'>";
			echo "<tr><th>NUME</th><th>DATA</th><th>LOCATIE</th></tr>";


			while ($row = $result->fetch_assoc()) {
				$timestamp = strtotime($row['DATA']);
				$formatted_date = date('Y-M-d', $timestamp);
				printf("<tr><td>%s</td><td>%s</td><td>%s</td></tr>", $row['NUME'],$formatted_date, $row['LOCATIE']);
			}
			echo "</table>";

	
		?>
		<div class="form-container">
			<form action="menu.html" method="post">
			  <input type="submit" name="Revenire" value="Revenire" class="btn btn-info">
			</form>
		</div>
</body>
</html>
