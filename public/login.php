<?php

    session_start();

?>
<?php

    require_once('../src/db.php');
    
    if (isset($_POST['btn-login'])) {
        $username = $_POST['username'];
        $password = $_POST['password'];

        $username = strip_tags($username);
        $username = addslashes($username);

        $password = strip_tags($password);
        $password = addslashes($password);

        if ($username == "" || $password == "") { ?>
            <script>
                alert('Username và password của bạn không được để trống')
            </script>
        <?php 
            $_SESSION['message'] = ['body' => 'Username và password của bạn không được để trống', 'type' => 'danger'];
            header('Location: ./index.php');
            die();
        } else {
            $sql = "SELECT * FROM `users` WHERE username = ?";
            $stmt = mysqli_prepare($conn, $sql);
            mysqli_stmt_bind_param($stmt, "s", $username);
            mysqli_stmt_execute($stmt);
            $result = mysqli_stmt_get_result($stmt);
            if (!$result || (mysqli_num_rows($result) < 1)) { ?>
                <script>
                    alert('Username không tồn tại');
                </script>
                
            <?php
            $_SESSION['message'] = ['body' => 'Username không tồn tại', 'type' => 'danger'];
            header('Location: ./index.php');
            die();
            }
            
            $dbarray = mysqli_fetch_array($result);

            if (password_verify($password, $dbarray['password'])) {
                $_SESSION['username'] = $username;
                // $_SESSION['password'] = $password;

                // Phân quyền
                if ($dbarray['user_type'] == 1) {
                    // Admin
                    header('Location: admin/index.php');
                } else {
                    // Member
                    header('Location: index.php');
                    $_SESSION['message'] = ['body' => 'Đăng nhập thành công', 'type' => 'success'];
                    die();
                }
            } else { ?>
                <script>
                    alert('Password không đúng');
                </script>
            <?php
                $_SESSION['message'] = ['body' => 'Mật khẩu không đúng', 'type' => 'danger'];
                header('Location: index.php');
                die();
            }
        }
    }

    // mysqli_close($conn);
?>