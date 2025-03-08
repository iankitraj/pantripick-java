<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Users List - PantriPick</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(-45deg, #1a1a2e, #16213e, #0f3460);
            background-size: 300% 300%;
            animation: bgAnimation 10s infinite alternate;
            color: white;
            text-align: center;
            padding: 20px;
        }

        @keyframes bgAnimation {
            0% { background-position: 0% 50%; }
            50% { background-position: 100% 50%; }
            100% { background-position: 0% 50%; }
        }

        .container {
            width: 90%;
            max-width: 800px;
            background: rgba(255, 255, 255, 0.95);
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            color: black;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            background: white;
            box-shadow: 0 2px 6px rgba(0, 0, 0, 0.2);
        }

        th, td {
            padding: 12px;
            text-align: center;
            border-bottom: 1px solid #ddd;
        }

        th {
            background: #007bff;
            color: white;
            cursor: pointer;
        }

        th:hover {
            background: #0056b3;
        }

        tr:hover {
            background: #f2f2f2;
        }

        .btn-danger {
            padding: 5px 10px;
            font-size: 12px;
        }
    </style>
</head>
<body>
    <%@ include file="AdminNavbar.jsp" %>

    <div class="container">
        <h2>Users List</h2>
        <input type="text" id="searchInput" placeholder="Search for Users..." class="form-control mb-2" onkeyup="searchItems()">

        <table>
            <thead>
                <tr>
                    <th onclick="sortTable(0)">Name</th>
                    <th onclick="sortTable(1)">Email</th>
                    <th onclick="sortTable(2)">Address</th>
                    <th onclick="sortTable(3)">Total Orders</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody id="itemsTable">
                <tr>
                    <td>Rishabh</td>
                    <td>rishabh@mail.com</td>
                    <td>Yagnik Road</td>
                    <td>4</td>
                    <td><button class="btn btn-danger" onclick="removeItem(this)">Remove</button></td>
                </tr>
                
                <tr>
                    <td>Raj</td>
                    <td>raj@mail.com</td>
                    <td>Trikonbaug</td>
                    <td>12</td>
                    <td><button class="btn btn-danger" onclick="removeItem(this)">Remove</button></td>
                </tr>
                
                <tr>
                    <td>Shailendra</td>
                    <td>shailendra@mail.com</td>
                    <td>Indira Circle</td>
                    <td>20</td>
                    <td><button class="btn btn-danger" onclick="removeItem(this)">Remove</button></td>
                </tr>
                
                <tr>
                    <td>Lakshya</td>
                    <td>lkumar@mail.com</td>
                    <td>Delhi</td>
                    <td>12</td>
                    <td><button class="btn btn-danger" onclick="removeItem(this)">Remove</button></td>
                </tr>
                
                <tr>
                    <td>Raghu</td>
                    <td>ryadav@mail.com</td>
                    <td>Pune</td>
                    <td>22</td>
                    <td><button class="btn btn-danger" onclick="removeItem(this)">Remove</button></td>
                </tr>
                
                <tr>
                    <td>Sunil</td>
                    <td>skumar@mail.com</td>
                    <td>Ahmedabad</td>
                    <td>30</td>
                    <td><button class="btn btn-danger" onclick="removeItem(this)">Remove</button></td>
                </tr>
                
                <tr>
                    <td>Anu</td>
                    <td>anu@mail.com</td>
                    <td>Patna</td>
                    <td>22</td>
                    <td><button class="btn btn-danger" onclick="removeItem(this)">Remove</button></td>
                </tr>
                
            </tbody>
        </table>
    </div>

    <script>
        function searchItems() {
            let input = document.getElementById("searchInput").value.toUpperCase();
            let table = document.getElementById("itemsTable");
            let tr = table.getElementsByTagName("tr");
            
            for (let i = 0; i < tr.length; i++) {
                let td = tr[i].getElementsByTagName("td")[1];
                if (td) {
                    let txtValue = td.textContent || td.innerText;
                    tr[i].style.display = txtValue.toUpperCase().includes(input) ? "" : "none";
                }
            }
        }

        function sortTable(n) {
            let table = document.querySelector("table");
            let rows = Array.from(table.rows).slice(1);
            let ascending = table.dataset.order !== "asc";

            rows.sort((rowA, rowB) => {
                let cellA = rowA.cells[n].textContent.trim();
                let cellB = rowB.cells[n].textContent.trim();
                return isNaN(cellA) ? cellA.localeCompare(cellB) : cellA - cellB;
            });

            if (!ascending) rows.reverse();
            table.tBodies[0].append(...rows);
            table.dataset.order = ascending ? "asc" : "desc";
        }

        function removeItem(button) {
            let row = button.parentNode.parentNode;
            row.style.opacity = "0";
            row.style.transform = "translateX(-10px)";
            setTimeout(() => row.parentNode.removeChild(row), 200);
        }
    </script>
</body>
</html>
