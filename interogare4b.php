<html>

<head>
	<title>Interogarea4b</title>
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

	$sql = file_get_contents('4b.sql');

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

	$sql = "CALL get_country_pairs()";
	$result = $mysqli->query($sql);

	echo "<table border='2'>";
	echo "<tr><th>Tara1</th><th>Tara2</th></tr>";
	
	while ($row = $result->fetch_assoc()) {
		printf("<tr><td>%s</td><td>%s</td></tr>", $row['Tara1'], $row['Tara2']);
	}
	echo "</table>";
?>

	<form action="interogare4b.html" method="post">
	  <input type="submit" name="Revenire" value="Revenire" style="color: darkblue; background-color: #B2BABB;">
	</form>


</body>
</html>