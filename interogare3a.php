<html>

<head>
	<title>Interogarea3a</title>
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
		die("Connection failed: " . $mysqli->connect_error);
	}

	$min_deplasament = $_POST['min_deplasament'];
	$max_deplasament = $_POST['max_deplasament'];


	$sql = file_get_contents('3a.sql');

	if ($mysqli->multi_query($sql) === TRUE) {
		printf("Procedura stocata a fost creata cu succes. Datele sunt: \n");
	} 
	else {
		printf("Procedura nu a fost creata, eroarea: %s\n\n", $mysqli->error);
	}

	$mysqli->close();
	$mysqli = new mysqli("localhost", "root", "", "clase");

	if ($mysqli->connect_error) {
		die("Connection failed: " . $mysqli->connect_error);
	}

	$sql = "CALL get_ships($min_deplasament, $max_deplasament)";
	$result = $mysqli->query($sql);

	echo "<table border='2'>";
	echo "<tr><th>Clasa</th><th>Tara</th><th>Deplasamentul</th></tr>";
	
	while ($row = $result->fetch_assoc()) {
		printf("<tr><td>%s</td><td>%s</td><td>%s</td></tr>", $row['Clasa'], $row['Tara'], $row['Deplasamentul']);
	}
	echo "</table>";
?>

	<form action="interogare3a.html" method="post">
	  <input type="submit" name="Revenire" value="Revenire" style="color: darkblue; background-color: #B2BABB;">
	</form>


</body>
</html>