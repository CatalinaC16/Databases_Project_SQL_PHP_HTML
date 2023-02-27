<html>

<head>
	<title>Consecinte</title>
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
		<p style="color:#315357 ; font-size: 23px; "><strong><em>Tabelul Consecinte: </em></strong></p>	
	</div>
	
		<?php

			$mysqli = new mysqli("localhost","root","","clase");

			if ($mysqli->connect_error) {
				die("Connection failed: ".$mysqli->connect_error);
			}

			$sql = "SELECT NAVA,BATALIE,REZULTAT FROM Consecinte";
			$result = $mysqli->query($sql);

			echo "<table border='2'>";
			echo "<tr><th>NAVA</th><th>BATALIE</th><th>REZULTAT</th></tr>";

			while ($row = $result->fetch_assoc()) {
					printf("<tr><td>%s</td><td>%s</td><td>%s</td></tr>", $row['NAVA'], $row['BATALIE'], $row['REZULTAT']);
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
