package com.shopping.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.shopping.model.CartItem;
import com.shopping.util.DbUtil;

public class CartDao {

        private Connection conn;

        public CartDao() {
            conn = DbUtil.getConnection();
        }
        
        public void addToCart(int userId, int productId, int quantity) throws SQLException {
            String query = "INSERT INTO cart (user_id, product_id) VALUES (?, ?)";
            try (PreparedStatement preparedStatement = conn.prepareStatement(query)) {
                preparedStatement.setInt(1, userId);
                preparedStatement.setInt(2, productId);
                preparedStatement.executeUpdate();
            }
        }

        public List<CartItem> getCartItems(int userId) throws SQLException {
            List<CartItem> cartItems = new ArrayList<>();
            String query = "SELECT c.product_id, p.name, p.price, p.image_url " +
                           "FROM cart c JOIN products p ON c.product_id = p.id WHERE c.user_id = ?";
            try (PreparedStatement preparedStatement = conn.prepareStatement(query)) {
                preparedStatement.setInt(1, userId);
                try (ResultSet resultSet = preparedStatement.executeQuery()) {
                    while (resultSet.next()) {
                        CartItem cartItem = new CartItem();
                        cartItem.setProductId(resultSet.getInt("product_id"));
                        cartItem.setProductName(resultSet.getString("name"));
                        cartItem.setPrice(resultSet.getDouble("price"));
                        cartItem.setImageUrl(resultSet.getString("image_url"));
                        cartItems.add(cartItem);
                    }
                }
            }
            return cartItems;
        }

        public void updateCartItemQuantity(int userId, int productId, int quantity) throws SQLException {
            String query = "UPDATE cart SET quantity = ? WHERE user_id = ? AND product_id = ?";
            try (PreparedStatement preparedStatement = conn.prepareStatement(query)) {
                preparedStatement.setInt(1, quantity);
                preparedStatement.setInt(2, userId);
                preparedStatement.setInt(3, productId);
                preparedStatement.executeUpdate();
            }
        }

        public void removeCartItem(int userId, int productId) throws SQLException {
            String query = "DELETE FROM cart WHERE user_id = ? AND product_id = ?";
            try (PreparedStatement preparedStatement = conn.prepareStatement(query)) {
                preparedStatement.setInt(1, userId);
                preparedStatement.setInt(2, productId);
                preparedStatement.executeUpdate();
            }
        }
        
        
        
        
        

        public List<CartItem> getCartItemsByUserId(int userId) {
            List<CartItem> cartItems = new ArrayList<>();
            String sql = "SELECT * FROM cart WHERE user_id = ?";
            try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                stmt.setInt(1, userId);
                ResultSet rs = stmt.executeQuery();
                while (rs.next()) {
                    CartItem cartItem = new CartItem(
                            rs.getInt("id"),
                            rs.getInt("user_id"),
                            rs.getInt("product_id")
                    );
                    cartItems.add(cartItem);
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
            return cartItems;
        }
        
        

       

        public void clearCart(int userId) {
            String sql = "DELETE FROM cart WHERE user_id = ?";
            try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                stmt.setInt(1, userId);
                stmt.executeUpdate();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        // Other methods as needed (e.g., updateCartItem, deleteCartItem, etc.)
    

    
    

    public void addCartItem(CartItem cartItem) {
        try {
            PreparedStatement preparedStatement = conn
                    .prepareStatement("INSERT INTO cart(user_id, product_id, quantity) VALUES (?, ?, ?)");
            preparedStatement.setInt(1, cartItem.getUserId());
            preparedStatement.setInt(2, cartItem.getProductId());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    

	/*
	 * public void updateCartItem(CartItem cartItem) { try { PreparedStatement
	 * preparedStatement = conn
	 * .prepareStatement("UPDATE cart SET quantity=? WHERE id=?");
	 * preparedStatement.setInt(1, cartItem.getQuantity());
	 * preparedStatement.setInt(2, cartItem.getCartItemId());
	 * preparedStatement.executeUpdate(); } catch (SQLException e) {
	 * e.printStackTrace(); } }
	 * 
	 * public void removeCartItem(int cartItemId) { try { PreparedStatement
	 * preparedStatement = conn .prepareStatement("DELETE FROM cart WHERE id=?");
	 * preparedStatement.setInt(1, cartItemId); preparedStatement.executeUpdate(); }
	 * catch (SQLException e) { e.printStackTrace(); } }
	 */

    public void clearCartByUserId(int userId) {
        try {
            PreparedStatement preparedStatement = conn
                    .prepareStatement("DELETE FROM cart WHERE user_id=?");
            preparedStatement.setInt(1, userId);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}