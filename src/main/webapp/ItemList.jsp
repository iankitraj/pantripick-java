<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ItemList - PantriPick</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        /* Background Animation */
        @keyframes bgAnimation {
            0% { background-position: 0% 50%; }
            50% { background-position: 100% 50%; }
            100% { background-position: 0% 50%; }
        }

        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(-45deg, #1a1a2e, #16213e, #0f3460);
            background-size: 300% 300%;
            animation: bgAnimation 10s infinite alternate;
            color: white;
            text-align: center;
            padding: 20px;
        }

        .container {
            width: 80%;
            max-width: 700px;
            background: rgba(255, 255, 255, 0.95);
            padding: 15px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            animation: fadeIn 0.8s ease-in-out;
            color: black;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(-10px); }
            to { opacity: 1; transform: translateY(0); }
        }

        table {
            width: 100%;
            border-collapse: collapse;
            font-size: 14px;
            background: white;
            box-shadow: 0 2px 6px rgba(0, 0, 0, 0.2);
        }

        th, td {
            padding: 10px;
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

        .product-img {
            width: 40px;
            height: auto;
            border-radius: 5px;
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
        <h2>Item List</h2>
        <input type="text" id="searchInput" placeholder="Search..." class="form-control mb-2" onkeyup="searchItems()">

        <table>
            <thead>
                <tr>
                    <th>Image</th>
                    <th onclick="sortTable(1)">Name</th>
                    <th onclick="sortTable(2)">Qty</th>
                    <th onclick="sortTable(3)">Price</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody id="itemsTable">
                <tr>
                    <td><img src="Image/Amul Cheese Block.jpeg" class="product-img"></td>
                    <td>Amul Cheese</td>
                    <td>36</td>
                    <td>₹70</td>
                    <td><button class="btn btn-danger" onclick="removeItem(this)">Remove</button></td>
                </tr>
                
                <tr>
                    <td><img src="Image/Quaker Rolled Oats.jpeg" class="product-img"></td>
                    <td>Oats</td>
                    <td>92</td>
                    <td>₹57</td>
                    <td><button class="btn btn-danger" onclick="removeItem(this)">Remove</button></td>
                </tr>
                
                 <tr>
                    <td><img src="Image/dahi.webp" class="product-img"></td>
                    <td>Amul Masti Dahi</td>
                    <td>15</td>
                    <td>₹150</td>
                    <td><button class="btn btn-danger" onclick="removeItem(this)">Remove</button></td>
                </tr>
                
                 <tr>
                    <td><img src="Image/eggs.webp" class="product-img"></td>
                    <td>Eggs</td>
                    <td>32</td>
                    <td>₹77</td>
                    <td><button class="btn btn-danger" onclick="removeItem(this)">Remove</button></td>
                </tr>
                
                <tr>
                    <td><img src="Image/bread.webp" class="product-img"></td>
                    <td>Britannia Brown Bread</td>
                    <td>17</td>
                    <td>₹50</td>
                    <td><button class="btn btn-danger" onclick="removeItem(this)">Remove</button></td>
                </tr>
                
                <tr>
                    <td><img src="Image/Biscuits.jpg" class="product-img"></td>
                    <td>Good Day Biscuits</td>
                    <td>10</td>
                    <td>₹100</td>
                    <td><button class="btn btn-danger" onclick="removeItem(this)">Remove</button></td>
                </tr>
                
                <tr>
                    <td><img src="Image/keloggs.jpg" class="product-img"></td>
                    <td>Honey Corn Flakes</td>
                    <td>32</td>
                    <td>₹77</td>
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
                    tr[i].style.display = txtValue.toUpperCase().indexOf(input) > -1 ? "" : "none";
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
