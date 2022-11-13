<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!doctype html>
<html lang="ko">
<head>
<style>
body {
    height: 100vh;
    display: flex;
    justify-content: center;
    align-items: center;
}

.btn {
    font-size: 25px;
    padding: 15px 30px;
    background-color: white;
    color: black;
    border: 3px solid black;
    border-radius: 30px;
    text-transform: uppercase;
    letter-spacing: 4px;
    font-family: sans-serif;
    transition: all 0.4s;
}

.btn:focus {
    outline: none;
}

.btn:hover {
    background-color: black;
    color: white;
}
</style>
</head>
<body>
  <button class="btn">Hello</button>

</body>
</html>