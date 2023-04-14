<?php
include("php/dbconnect.php");
include("php/checklogin.php");        

error_reporting(0);

$errormsg= '';

$sname='';
$contact='';
$joindate = '';
$fees='';
$balance='';

$sname = $_SESSION['rainbow_username'];
$contact = $_SESSION['rainbow_contact'];
$joindate = $_SESSION['rainbow_joindate'];
$fees = $_SESSION['rainbow_fees'];
$balance = $_SESSION['rainbow_balance'];

$sql = "select s.id,s.sname,s.balance,s.fees,s.contact,b.branch,s.joindate from student as s,branch as b where b.id=s.branch and  s.delete_status='0' and s.contact='".$contact."'";
$q = $conn->query($sql);
$res = $q->fetch_assoc();
$sid = $res['id'];

$amount =  $_POST['amount'];

$sql1 = "SELECT balance FROM student WHERE id = '$sid'";
$tpq = $conn->query($sql1);
$tpr = $tpq->fetch_assoc();
$b = $tpr['balance'];
if($balance==0){
    $tbalance = 0;
}
else{
$tbalance = $b - $amount;
}
if(isset($_POST['student_save']))
{
    $amount =  $_POST['amount'];

    $paid = $amount;
    date_default_timezone_set('Asia/Kolkata');
    $submitdate = "" . date("Y-m-d") . " " . date("h:i:s");
    $transcation_remark = '';

    if($balance>0){
        
        $sql = "insert into fees_transaction(stdid,submitdate,transcation_remark,paid) values('$sid','$submitdate','$transcation_remark','$paid') ";
        $conn->query($sql);

        $sql = "update student set balance='$tbalance' where id = '$sid'";
        $conn->query($sql);
    
        echo '<script type="text/javascript">window.location="student_fees.php?act=1";</script>';
    }
   

}
if(isset($_REQUEST['act']) && @$_REQUEST['act']=="1")
{
    $errormsg = "<div class='alert alert-success'><a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a><strong>Success!</strong> Fees submit successfully</div>";
}
?>

    <!-- <script type="text/javascript">
        $(document).ready( function() {
            $("#submitdate").datepicker( {
                changeMonth: true,
                changeYear: true,
                dateFormat: "yy-mm-dd",
            });
        });
    </script> -->

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Online Fees Payment System</title>

    <!-- BOOTSTRAP STYLES-->
    <link href="css/bootstrap.css" rel="stylesheet" />
    <!-- FONTAWESOME STYLES-->
    <link href="css/font-awesome.css" rel="stylesheet" />
       <!--CUSTOM BASIC STYLES-->
    <link href="css/basic.css" rel="stylesheet" />
    <!--CUSTOM MAIN STYLES-->
    <link href="css/custom.css" rel="stylesheet" />
    <!-- GOOGLE FONTS-->
    <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />
	
	<link href="css/ui.css" rel="stylesheet" />
	<link href="css/jquery-ui-1.10.3.custom.min.css" rel="stylesheet" />	
	<link href="css/datepicker.css" rel="stylesheet" />	
	<link href="css/datatable/datatable.css" rel="stylesheet" />
	   
    <script src="js/jquery-1.10.2.js"></script>	
    <script type='text/javascript' src='js/jquery/jquery-ui-1.10.1.custom.min.js'></script>
    <script type="text/javascript" src="js/validation/jquery.validate.min.js"></script>
 
	<script src="js/dataTable/jquery.dataTables.min.js"></script>
		
    <style>
        #amount {
            <?php
                if($balance==0){
                    echo 'display:none';
                }
            ?>
        }
        #pay {
            <?php
                if($balance==0){
                    echo 'display:none';
                }
            ?>
        }
    </style>
		 
	
</head>
<?php
include("php/student_header.php");
?>
        <div class="page-wrapper-student">
            <div id="page-inner">
                <div class="row">
                    <div class="col-md-12">
                        <h1 class="page-head-line">Fees
                        <a href="student_index.php" style="float:right;color:black;font-size:20px;padding: 0 30px;"><i class="fa fa-home"></i> Home</a>
                        </h1>

                    </div>
                </div>
				
        <?php
		    echo $errormsg;
		?>

                <div class="row">
				    <div class="col-sm-8 col-sm-offset-2">
                        <div class="panel panel-primary">
                            <div class="panel-heading">
                                Pay Fees
                            </div>

                    <form action="student_fees.php" method="post" id="signupForm1" class="form-horizontal">

                <div class="row">
			        <div class="col-sm-10 col-sm-offset-1">
                        <div class="panel panel-primary">
                    
				<form action="student.php" method="post" id="signupForm1" class="form-horizontal">
                
                <div class="panel-body">
					<fieldset class="scheduler-border" >

						<legend  class="scheduler-border">Personal Information : </legend>
						<div class="form-group">
								<label class="col-sm-2 control-label" for="Old">Name </label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="sname" name="sname" value="<?php echo $sname;?>"  readonly/>
								</div>
						</div>


						<div class="form-group">
								<label class="col-sm-2 control-label" for="Old">Contact </label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="contact" name="contact" value="<?php echo $contact;?>" maxlength="10" readonly/>
								</div>
							</div>
						
						
						<div class="form-group">
							<label class="col-sm-2 control-label" for="Old">Date Of Joining </label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="joindate" name="joindate" value="<?php echo  ($joindate!='')?date("Y-m-d", strtotime($joindate)):'';?>"  readonly />
								</div>
						</div>
					
                    </fieldset>
						
						
					<fieldset class="scheduler-border" >

						<legend  class="scheduler-border">Fee Information : </legend>
						<div class="form-group">
								<label class="col-sm-2 control-label" for="Old">Total Fees </label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="fees" name="fees" value="<?php echo $fees;?>" readonly />
								</div>
						</div>
			

                        <div class="form-group">
								<label class="col-sm-2 control-label" for="Old">Balance </label>
								<div class="col-sm-10">
									<input type="text" class="form-control"  id="tbalance" name="tbalance" value="<?php echo $tbalance;?>" disabled />
								</div>
						</div>
					
                    </fieldset>
							

                    <div class="panel-body" id="amount">
                        <div class="form-group" >
                            <label class="col-sm-4 control-label" for="amount">Amount to Pay </label>
                            <div class="col-sm-5">
                                <input type="number" class="form-control" id="payamount" name="amount"  />
                            </div>
                        </div>
                        
                        
                    <div class="form-group" id="pay">
                        <div class="col-sm-9 col-sm-offset-4">
                            <button type="submit" name="student_save" class="btn btn-primary" id="payment">Pay </button>
                        </div>
                    </div>
                     
                       
                    </div>
                    
                    </form>
                        
                </div>
            </div>
        
            </div>
            <!-- /. ROW  -->
        </div>
        <!-- /. PAGE INNER  -->
    </div>
				
    	
		
		

    <!-- BOOTSTRAP SCRIPTS -->
    <script src="js/bootstrap.js"></script>
    <!-- METISMENU SCRIPTS -->
    <script src="js/jquery.metisMenu.js"></script>
       <!-- CUSTOM SCRIPTS -->
    <script src="js/custom1.js"></script>

    
</body>
</html>
