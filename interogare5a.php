<html>

<head>
	<title>Interogarea5a</title>
	<link rel="stylesheet" type="text/css" href="css/bootstrap.css">
	<style type="text/css">
		body {
			padding-top: 50px;
			background-color: #B2BABB;
			text-align: center;
			color: darkblue;
		}
		table {
			margin: 0 auto;
		}
	
	</style>
</head>

<body>	
<?php

	$mysqli = new mysqli("localhost", "root", "", "clase");

	if ($mysqli->connect_error) {
		die("Connection failed: ".$mysqli->connect_error);
	}

	$sql = file_get_contents('5a.sql');

	if ($mysqli->multi_query($sql) === TRUE) {
		printf("Procedura stocata a fost creata cu succes. Datele sunt: \n");
	} 
	else {
		printf("Procedura nu a fost creata, eroarea: %s\n\n", $mysqli->error);
	}

	$mysqli->close();
	$mysqli = new mysqli("localhost", "root", "", "clase");

	if ($mysqli->connect_error) {
		die("Connection failed: ".$mysqli->connect_error);
	}

	$sql = "CALL get_ships_with_min_arms()";
	$result = $mysqli->query($sql);

	echo "<table border='2'>";
	echo "<tr><th>NUME</th><th>CLASA</th><th>ANUL_LANSARII</th><th>TIP</th><th>TARA</th><th>NR_ARME</th><th>DIAMETRU_TUN</th><th>DEPLASAMENT</th></tr>";
	
	while ($row = $result->fetch_assoc()) {
		printf("<tr><td>%s</td><td>%s</td><td>%s</td><td>%s</td><td>%s</td><td>%s</td><td>%s</td><td>%s</td></tr>", $row['NUME'], $row['CLASA'], $row['ANUL_LANSARII'], $row['TIP'], $row['TARA'], $row['NR_ARME'], $row['DIAMETRU_TUN'], $row['DEPLASAMENT']);
	}
	echo "</table>";
?>

	<form action="interogare5a.html" method="post">
	  <input type="submit" name="Revenire" value="Revenire" style="color: darkblue; background-color: #B2BABB;">
	</form>


</body>
</html>