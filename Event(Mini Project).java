/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.college.events;

import javax.swing.*;
import javax.swing.table.DefaultTableModel;
import java.awt.*;
import java.sql.*;

/**
 *
 * @author Chiranth D
 */


public class App {
    private static final String DB_URL = "jdbc:mysql://localhost:3306/event_management_db";
    private static final String DB_USER = "Chiranth D";
    private static final String DB_PASS = "Chiranth@2007"; // Change to your MySQL password

    public static void main(String[] args) {
        SwingUtilities.invokeLater(LoginFrame::new);
    }

    // ==================== 1. LOGIN FRAME ====================
    static class LoginFrame extends JFrame {
        private JTextField txtUser;
        private JPasswordField txtPass;

        public LoginFrame() {
            setTitle("Admin Login - Event Registration System");
            setSize(360, 220);
            setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
            setLocationRelativeTo(null);
            setLayout(new GridLayout(3, 2, 10, 10));

            add(new JLabel("  Username:"));
            txtUser = new JTextField();
            add(txtUser);

            add(new JLabel("  Password:"));
            txtPass = new JPasswordField();
            add(txtPass);

            JButton btnLogin = new JButton("Login");
            add(new JLabel());
            add(btnLogin);

            btnLogin.addActionListener(e -> {
                String user = txtUser.getText().trim();
                String pass = new String(txtPass.getPassword()).trim();

                String sql = "SELECT * FROM users WHERE username = ? AND password = ?";
                try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASS);
                     PreparedStatement pst = conn.prepareStatement(sql)) {
                    pst.setString(1, user);
                    pst.setString(2, pass);
                    ResultSet rs = pst.executeQuery();

                    if (rs.next()) {
                        JOptionPane.showMessageDialog(this, "Login Successful!");
                        dispose();
                        new DashboardFrame().setVisible(true);
                    } else {
                        JOptionPane.showMessageDialog(this, "Invalid Username or Password!", "Error", JOptionPane.ERROR_MESSAGE);
                    }
                } catch (SQLException ex) {
                    JOptionPane.showMessageDialog(this, "Database Connection Error: " + ex.getMessage());
                }
            });
            setVisible(true);
        }
    }

    // ==================== 2. DASHBOARD FRAME ====================
    static class DashboardFrame extends JFrame {
        private JTextField txtId, txtName, txtEmail, txtPhone;
        private JComboBox<String> cbEvent, cbTicket;
        private DefaultTableModel model;
        private JTable table;

        public DashboardFrame() {
            setTitle("Event Management Dashboard - CRUD System");
            setSize(950, 550);
            setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
            setLocationRelativeTo(null);
            setLayout(new BorderLayout(10, 10));

            // Left Input Form Panel
            JPanel formPanel = new JPanel(new GridLayout(7, 2, 6, 6));
            formPanel.setBorder(BorderFactory.createTitledBorder("Attendee Management"));

            formPanel.add(new JLabel("Attendee ID:"));
            txtId = new JTextField();
            txtId.setEditable(true); // <--- ALLOWED USER INPUT FOR ID
            formPanel.add(txtId);

            formPanel.add(new JLabel("Full Name:"));
            txtName = new JTextField();
            formPanel.add(txtName);

            formPanel.add(new JLabel("Email:"));
            txtEmail = new JTextField();
            formPanel.add(txtEmail);

            formPanel.add(new JLabel("Phone:"));
            txtPhone = new JTextField();
            formPanel.add(txtPhone);

            formPanel.add(new JLabel("Event:"));
            cbEvent = new JComboBox<>(new String[]{"Tech Symposium 2026", "AI Workshop", "Annual Hackathon"});
            formPanel.add(cbEvent);

            formPanel.add(new JLabel("Ticket Type:"));
            cbTicket = new JComboBox<>(new String[]{"General", "VIP", "Student"});
            formPanel.add(cbTicket);

            JButton btnAdd = new JButton("INSERT (Add)");
            JButton btnUpdate = new JButton("UPDATE");
            formPanel.add(btnAdd);
            formPanel.add(btnUpdate);

            // Center Table Panel
            model = new DefaultTableModel(new String[]{"ID", "Name", "Email", "Phone", "Event", "Ticket"}, 0);
            table = new JTable(model);
            JScrollPane scrollPane = new JScrollPane(table);

            add(formPanel, BorderLayout.WEST);
            add(scrollPane, BorderLayout.CENTER);

            // South Action Buttons Panel
            JPanel southPanel = new JPanel();
            JButton btnRefresh = new JButton("SELECT (Refresh Table)");
            JButton btnDelete = new JButton("DELETE Selected");
            JButton btnClear = new JButton("Clear Fields");

            southPanel.add(btnRefresh);
            southPanel.add(btnDelete);
            southPanel.add(btnClear);
            add(southPanel, BorderLayout.SOUTH);

            // Table Row Click Listener
            table.getSelectionModel().addListSelectionListener(e -> {
                int row = table.getSelectedRow();
                if (row != -1) {
                    txtId.setText(model.getValueAt(row, 0).toString());
                    txtId.setEditable(false); // Disable editing ID when updating an existing record
                    txtName.setText(model.getValueAt(row, 1).toString());
                    txtEmail.setText(model.getValueAt(row, 2).toString());
                    txtPhone.setText(model.getValueAt(row, 3).toString());
                    cbEvent.setSelectedItem(model.getValueAt(row, 4).toString());
                    cbTicket.setSelectedItem(model.getValueAt(row, 5).toString());
                }
            });

            // Action Listeners
            btnAdd.addActionListener(e -> insertRecord());
            btnUpdate.addActionListener(e -> updateRecord());
            btnDelete.addActionListener(e -> deleteRecord());
            btnRefresh.addActionListener(e -> loadData());
            btnClear.addActionListener(e -> clearFields());

            loadData();
        }

        private void loadData() {
            model.setRowCount(0);
            String sql = "SELECT * FROM attendees";
            try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASS);
                 Statement st = conn.createStatement();
                 ResultSet rs = st.executeQuery(sql)) {
                while (rs.next()) {
                    model.addRow(new Object[]{
                        rs.getInt("attendee_id"),
                        rs.getString("name"),
                        rs.getString("email"),
                        rs.getString("phone"),
                        rs.getString("event_name"),
                        rs.getString("ticket_type")
                    });
                }
            } catch (SQLException e) {
                JOptionPane.showMessageDialog(this, "Error Loading Data: " + e.getMessage());
            }
        }

        // INSERT Operation including manual ID
        private void insertRecord() {
            String idStr = txtId.getText().trim();
            String name = txtName.getText().trim();
            String email = txtEmail.getText().trim();
            String phone = txtPhone.getText().trim();
            String event = (String) cbEvent.getSelectedItem();
            String ticket = (String) cbTicket.getSelectedItem();

            if (idStr.isEmpty() || name.isEmpty() || email.isEmpty() || phone.isEmpty()) {
                JOptionPane.showMessageDialog(this, "Please fill in all fields including Attendee ID!");
                return;
            }

            int id;
            try {
                id = Integer.parseInt(idStr);
            } catch (NumberFormatException e) {
                JOptionPane.showMessageDialog(this, "Attendee ID must be a valid number!");
                return;
            }

            String sql = "INSERT INTO attendees (attendee_id, name, email, phone, event_name, ticket_type) VALUES (?, ?, ?, ?, ?, ?)";
            try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASS);
                 PreparedStatement pst = conn.prepareStatement(sql)) {
                pst.setInt(1, id);
                pst.setString(2, name);
                pst.setString(3, email);
                pst.setString(4, phone);
                pst.setString(5, event);
                pst.setString(6, ticket);
                pst.executeUpdate();

                JOptionPane.showMessageDialog(this, "Record Inserted Successfully!");
                clearFields();
                loadData();
            } catch (SQLException e) {
                JOptionPane.showMessageDialog(this, "Insert Error (ID might already exist): " + e.getMessage());
            }
        }

        private void updateRecord() {
            String idStr = txtId.getText().trim();
            if (idStr.isEmpty()) {
                JOptionPane.showMessageDialog(this, "Please select a record from the table to update.");
                return;
            }

            String sql = "UPDATE attendees SET name = ?, email = ?, phone = ?, event_name = ?, ticket_type = ? WHERE attendee_id = ?";
            try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASS);
                 PreparedStatement pst = conn.prepareStatement(sql)) {
                pst.setString(1, txtName.getText().trim());
                pst.setString(2, txtEmail.getText().trim());
                pst.setString(3, txtPhone.getText().trim());
                pst.setString(4, (String) cbEvent.getSelectedItem());
                pst.setString(5, (String) cbTicket.getSelectedItem());
                pst.setInt(6, Integer.parseInt(idStr));
                pst.executeUpdate();

                JOptionPane.showMessageDialog(this, "Record Updated Successfully!");
                clearFields();
                loadData();
            } catch (SQLException e) {
                JOptionPane.showMessageDialog(this, "Update Error: " + e.getMessage());
            }
        }

        private void deleteRecord() {
            int row = table.getSelectedRow();
            if (row == -1) {
                JOptionPane.showMessageDialog(this, "Please select a row from the table to delete.");
                return;
            }

            int id = (int) model.getValueAt(row, 0);
            int confirm = JOptionPane.showConfirmDialog(this, "Are you sure you want to delete ID: " + id + "?", "Confirm Delete", JOptionPane.YES_NO_OPTION);

            if (confirm == JOptionPane.YES_OPTION) {
                String sql = "DELETE FROM attendees WHERE attendee_id = ?";
                try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASS);
                     PreparedStatement pst = conn.prepareStatement(sql)) {
                    pst.setInt(1, id);
                    pst.executeUpdate();

                    JOptionPane.showMessageDialog(this, "Record Deleted Successfully!");
                    clearFields();
                    loadData();
                } catch (SQLException e) {
                    JOptionPane.showMessageDialog(this, "Delete Error: " + e.getMessage());
                }
            }
        }

        private void clearFields() {
            txtId.setText("");
            txtId.setEditable(true); // Re-enable editing for new entries
            txtName.setText("");
            txtEmail.setText("");
            txtPhone.setText("");
            cbEvent.setSelectedIndex(0);
            cbTicket.setSelectedIndex(0);
            table.clearSelection();
        }
    }
}
