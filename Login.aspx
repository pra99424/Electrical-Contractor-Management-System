<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
        <link href="style/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="style/bootstrap-responsive.min.css" rel="stylesheet" type="text/css" />


    <link href="style/style.css" rel="stylesheet" type="text/css" />
    <link href="style/pages/signin.css" rel="stylesheet" type="text/css" />

</head>
<body>
    <form id="form1" runat="server">
     <div class="navbar navbar-fixed-top">

                <div class="navbar-inner">

                    <div class="container">

                        <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </a>

                        <a class="brand" href="#">Login
                        </a>

                        <div class="nav-collapse">
                            <ul class="nav pull-right">


                                <li class="">
                                    <a href="Registration.aspx" class="">
                                        <i class="icon-chevron-left"></i>
                                        REGISTER
                                    </a>

                                </li>
                            </ul>

                        </div>
                        <!--/.nav-collapse -->

                    </div>
                    <!-- /container -->

                </div>
                <!-- /navbar-inner -->

            </div>
            <!-- /navbar -->
            <div style="color:Fuchsia;padding-top:20px;" align="center">
                <h1>ASPIR CONSTRUCTOR</h1>
             </div>
            <div class="account-container">

                <div class="content clearfix">

                    <h1>Member Login</h1>
                    <div class="login-fields">
                        <p>
                            Please provide your details
                        </p>
                        <div class="field">
                            <%--<asp:Label ID="lblTime" runat="server" ></asp:Label>--%>
                                <asp:Label ID="Label1" runat="server" Text="Role"></asp:Label>


                                 <asp:DropDownList ID="cboRole" runat="server">
                            
                            <%--<asp:ListItem>Admin</asp:ListItem>--%>
                            <asp:ListItem>Senior Engineer</asp:ListItem>
                            <asp:ListItem>Junior Engineer</asp:ListItem>
                            <asp:ListItem>User</asp:ListItem>
                             
                        </asp:DropDownList>



                        </div>
                        <div class="field">
                            <%--<asp:Label ID="lblTime" runat="server" ></asp:Label>--%>
                                <asp:Label ID="Label3" runat="server" Text="User Name"></asp:Label>


                            <asp:TextBox ID="txtUserName" CssClass="login username-field" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                                ErrorMessage="*" ControlToValidate="txtUserName"
                                ValidationGroup="Save" ForeColor="Red"></asp:RequiredFieldValidator>




                        </div>
                        <!-- /field -->
                        <div class="field">
                            
                                <asp:Label ID="Label4" runat="server" Text="Password"></asp:Label>

                            <asp:TextBox ID="txtPassword" CssClass="login password-field" TextMode="Password" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server"
                                ErrorMessage="*" ControlToValidate="txtPassword" ValidationGroup="Save" ForeColor="Red"></asp:RequiredFieldValidator>




                        </div>
                        <!-- /password -->
                    </div>
                    <!-- /login-fields -->
                    <div class="login-actions">

                        <asp:Button ID="btnLogin" CssClass="button btn btn-success btn-large" runat="server" ValidationGroup="Save" Text="Login" OnClick="btnLogin_Click" />


                        <asp:HiddenField ID="HiddenField1" runat="server" />

                    </div>
                    <!-- .actions -->

                </div>
                <!-- /content -->

            </div>
            <!-- /account-container -->






        </div>

    </form>
</body>
</html>
