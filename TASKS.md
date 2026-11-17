# MP4 - Task Distribution (search "TODO" in each file)

| Member | Area | Files |
|--------|------|-------|
| Calipes | Auth and sessions | controllers/LoginServlet, LogoutServlet, RegisterServlet; filters/AuthFilter, NoCacheFilter; dao/UserDAO; models/User; login.jsp, register.jsp |
| Cortez | Catalog, cart, checkout | controllers/ProductServlet, CartServlet, CheckoutServlet; dao/ProductDAO, OrderDAO; models/Product, CartItem, Order; products.jsp, product-detail.jsp, user/cart.jsp, user/checkout.jsp, user/orders.jsp |
| Dizon | Layout, listeners, config, errors | listeners/*; utils/*; web.xml; includes/*; css/style.css; js/script.js; index.jsp, user/home.jsp, about.html; errors/*.jsp |

Rubric check: relative + absolute paths | responsive (style.css) | 2 roles | session + logout + back button | visitor counter | 2 welcome files | 3+ scriptlets | 4 error pages | ServletConfig + ServletContext + ServletContextListener.
