# MySql-Project-Management

#Create your database with Mysql with Mysql file

#Connect to database
try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/root";// your db name
            String user = "root"; // your db username
            String password = "hao152903"; // your db password
            Connection conn = DriverManager.getConnection(url, user, password);
            if (conn != null) {
                System.out.println("Connect success!");
            }
            String id="1";
            var sql = "select * from user where user.id_code="+id;
            var statement = conn.prepareStatement(sql);
            var resultSet = statement.executeQuery();
            
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
}


#Create random id

public class MyBigInteger {
    public static void main(String[] args) {
        BigInteger number = generateMyBigNumber(200);
        System.out.println("My big number is: " + number);
    }

    public static BigInteger generateMyBigNumber(int bit){
        Random ran = new Random();
        BigInteger res = new BigInteger(bit, ran);
        return  res;
    }
}

#Login:

 String temp_email=txt_email_input.getText();
                String temp_pass=txt_pass_input.getText().toString();
                try {
                    PreparedStatement stmt= (PreparedStatement) conn.prepareStatement("Select * from user where email_login=? and password=?");
                    stmt.setString(1, temp_email);
                    stmt.setString(2, temp_pass);
                    ResultSet rs=stmt.executeQuery();
                    if(rs.next()) {
                        System.out.println("Done");
                        txt_pass_input.setText("");
                    }
                    else {
                        System.out.println("Error");
                    }
                } catch (SQLException throwables) {
                    throwables.printStackTrace();
                }
                
#Create Jlist and insert Elements into it

DefaultListModel<String> model;
private static ArrayList<Product> arr_Products;
model = new DefaultListModel<>();
arr_Products=new ArrayList<>();
for(Product product : arr_Products) {
    model.addElement(product.getProduct_id());
}
list_product.setModel(model);