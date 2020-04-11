<?php include 'db.php';?>
<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title></title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <style media="screen">
            /* The Modal (background) */
      .modal {
        display: none; /* Hidden by default */
        position: fixed; /* Stay in place */
        z-index: 1; /* Sit on top */
        padding-top: 100px; /* Location of the box */
        left: 0;
        top: 0;
        width: 100%; /* Full width */
        height: 100%; /* Full height */
        overflow: auto; /* Enable scroll if needed */
        background-color: rgb(0,0,0); /* Fallback color */
        background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
      }

      /* Modal Content */
      .modal-content {
        background-color: #fefefe;
        margin: auto;
        padding: 20px;
        border: 1px solid #888;
        width: 80%;
      }

      /* The Close Button */
      .close {
        color: #aaaaaa;
        float: right;
        font-size: 28px;
        font-weight: bold;
      }

      .close:hover,
      .close:focus {
        color: #000;
        text-decoration: none;
        cursor: pointer;
      }
    </style>
  </head>
  <body>
    <table class="table table-striped table-dark">
  <thead>
    <tr>
      <th scope="col">State</th>
      <th scope="col">Confirmed</th>
      <th scope="col">Active</th>
      <th scope="col">Recovered</th>
      <th scope="col">Deaths</th>
    </tr>
  </thead>
  <?php $query = "SELECT * FROM states";
                  $select_all_posts = mysqli_query($conn,$query);
                  while($row = mysqli_fetch_assoc($select_all_posts)){
                        $state = $row['state'];
                        $confirmed = $row['confirmed'];
                        $active = $row['active'];
                        $recovered = $row['recovered'];
                        $death = $row['deaths'];
                        $iconfirmed = $row['iconfirmed'];
                        $irecovered = $row['irecovered'];
                        $ideath = $row['ideaths'];
                        $state2 = str_replace(" ","",$state);
        ?>
  <tbody>
    <!--  -->
    <tr data-toggle="collapse" data-target="<?php echo "#".$state2;?>" class="accordion-toggle">
				<td><?php echo $state;?></td>
				<td><?php echo $confirmed;?><span style="color:red;"><?php if ($iconfirmed != 0) {echo "(+".$iconfirmed.")";}?></td>
				<td><?php echo $active;?></td>
				<td><?php echo $recovered;?><span style="color:#83FF48;"><?php if ($irecovered != 0) {echo "(+".$irecovered.")";}?></td>
				<td><?php echo $death;?><span style="color: #A2B8B6;"><?php if ($ideath != 0) {echo "(+".$ideath.")";}?></td>
			</tr>
   
			<tr >
            <td colspan="6" class="hiddenRow"><div class="accordian-body collapse" id="<?php echo $state2;?>">
            
            
            
            </div> </td>
        </tr>
			<?php }?>
    <!--  -->
  </tbody>
</table>


  </body>
  <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
<script>
$('.accordian-body').on('show.bs.collapse', function () {
    $(this).closest("table")
        .find(".collapse.in")
        .not(this)
        //.collapse('toggle')
})    
    
</script>
</html>
