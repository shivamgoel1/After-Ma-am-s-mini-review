
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<!------ Include the above in your HEAD tag ---------->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<style>
body {
     background: url('https://images.pexels.com/photos/40568/medical-appointment-doctor-healthcare-40568.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940') fixed;
    background-size: cover;
}

*[role="form"] {
    max-width: 530px;
    padding: 15px;
    margin: 0 auto;
    border-radius: 0.3em;
    background-color: #659DBD ;
    color:#242582;
    font-weight: 600;
    font-family: "Roboto", sans-serif;
}
.form-control{

    background-color: #DAAD86;
    font-weight: 600;
    
}

*[role="form"] h2 { 
    font-family: 'Open Sans' , sans-serif;
    font-size: 40px;
    font-weight: 600;
    color: #242582;
    margin-top: 5%;
    text-align: center;
    text-transform: uppercase;
    letter-spacing: 4px;
    font-family: "Roboto", sans-serif;
 
   
}
#myList
{
    background-color: #DAAD86; 
    font-family: "Roboto", sans-serif;
    font-weight: 600;
}

li a {
  display: block;
  color: #242582;
  padding: 8px 16px;
  text-decoration: none;
}

 a.active {
  background-color: #DAAD86;
  color: red;
}
li a:hover:not(.active) {
  background-color: #DAAD86;
  color: red;
}

.sidebar {
  height: 100%;
  width: 0;
  position: fixed;
  z-index: 1;
  top: 0;
  left: 0;
  background-color: #659DBD;
  overflow-x: hidden;
  transition: 0.5s;
  padding-top: 60px;
  font-weight: 600;
  font-family: "Roboto", sans-serif;
}

.sidebar a {
  padding: 8px 8px 8px 32px;
  text-decoration: none;
  font-size: 20px;
  color:#242582;
  display: block;
  transition: 0.3s;
}

.sidebar a:hover {
  color: #DAAD86;
}

.sidebar .closebtn {
  position: absolute;
  top: 0;
  right: 25px;
  font-size: 20px;
  margin-left: 50px;
}

.openbtn {
  font-size: 20px;
  cursor: pointer;
  background-color: #242582;
  color: #DAAD86;
  padding: 10px 15px;
  border: none;
  position: fixed;
  bottom: 600px;
}

.openbtn:hover {
  background-color:black;
}

#main {
  transition: margin-left .5s;
  padding: 16px;
}

/* On smaller screens, where height is less than 450px, change the style of the sidenav (less padding and a smaller font size) */
@media screen and (max-height: 450px) {
  .sidebar {padding-top: 15px;}
  .sidebar a {font-size: 18px;}
}

</style>

<script src=""></script>

<script>
    $(function(){
	$.validator.setDefaults({
		highlight: function(element){
			$(element)
			.closest('.form-group')
			.addClass('has-error')
		},
		unhighlight: function(element){
			$(element)
			.closest('.form-group')
			.removeClass('has-error')
		}
	});
	
	$.validate({
		rules:
		{	
		    password: "required",
			birthDate: "required",
			weight: {
			    required:true,
			    number:true
			},
			height:  {
			    required:true,
			    number:true
			},
			email: {
				required: true,
				email: true
			}
		},
			messages:{			
				email: {
				required: true,
				email: true
			}
		},
				password: {
					required: " Please enter password"
				},
				birthDate: {
					required: " Please enter birthdate"
				},
				email: {
					required: ' Please enter email',
					email: ' Please enter valid email'
				},
				weight: {
					required: " Please enter your weight",
					number: " Only numbers allowed"
				},
				height: {
					required: " Please enter your height",
					number: " Only numbers allowed"
				},
			}
			
	});
});
</script>

<script>

    function openNav() {
  document.getElementById("mySidebar").style.width = "250px";
  document.getElementById("main").style.marginLeft = "250px";
}

function closeNav() {
  document.getElementById("mySidebar").style.width = "0";
  document.getElementById("main").style.marginLeft= "0";
}

<script>
function ageCalculate(){
//document.getElementById('age').InnerHtml
// document.getElementById("demo").InnerHtml=4+5;
//document.write="Hi";
var birthDate =document.getElementById('birth_date').value;

//if(birthDate==""){
//  alert("Choose correct birthdate.")
//}else{
//  alert(birthDate);
//  alert(Date());
var d = new Date(birthDate);

// document.getElementById("age").innerHTML = d;

//}

    var mdate = birthDate.toString();
    var yearThen = parseInt(mdate.substring(0,4), 10);
    var monthThen = parseInt(mdate.substring(5,7), 10);
    var dayThen = parseInt(mdate.substring(8,10), 10);
    
    var today = new Date();
    var birthday = new Date(yearThen, monthThen-1, dayThen);
 //   alert(today.valueOf() + " " + birthday.valueOf());
    var differenceInMilisecond = today.valueOf() - birthday.valueOf();
  //  alert(differenceInMilisecond);
    
    var year_age = Math.floor(differenceInMilisecond / 31536000000);
    var day_age = Math.floor((differenceInMilisecond % 31536000000) / 86400000);
    
    if ((today.getMonth() == birthday.getMonth()) && (today.getDate() == birthday.getDate())) {
        alert("Happy B'day!!!");
    }
    
    var month_age = Math.floor(day_age/30);
    
    day_age = day_age % 30;
    
    var tMnt= (month_age + (year_age*12));
    var tDays =(tMnt*30) + day_age;
    
    if (isNaN(year_age) || isNaN(month_age) || isNaN(day_age)) {
        document.getElementById("age").innerHTML = ("Invalid birthday - Please try again!");
    }
    else if(year_age<=18)
    	{
    	alert("Invalid birthday - Please try again!");
    	}
    else {
        document.getElementById("age").value = year_age;
    }

}

</script>
<div class="container">
            <form class="form-horizontal" role="form" action="saveAdmin" method="post">
                <h2>Admin Registration</h2>
                <div class="form-group">
                    <label for="firstName" class="col-sm-3 control-label">First Name</label>
                    <div class="col-sm-9">
                        <input type="text" name="firstName" placeholder="First Name" class="form-control" autofocus required>
                    </div>
                </div>
                <div class="form-group">
                    <label for="lastName" class="col-sm-3 control-label">Last Name</label>
                    <div class="col-sm-9">
                        <input type="text" name="lastName" placeholder="Last Name" class="form-control"  required>
                    </div>
              
                <div class="form-group">
                    <label for="gender" class="col-sm-3 control-label">Gender</label>
                    <select name = "gender">
                        <option value = "male">Male</option>
                        <option value = "female">Female</option>
                      </select>
            </div>
            <div class="form-group">
                    <label for="birthDate" class="col-sm-3 control-label">Date of Birth</label>
                    <div class="col-sm-9">
                       <input type="date"  name="dob" id="birth_date" class="form-control" oninput="ageCalculate()" required>
                       
                    </div>
                </div>
                <div></div>
                
                <div class="form-group">
                    <label for="age" class="col-sm-3 control-label">Age</label>
                    <div class="col-sm-9">
                        <input type="text" name="age" id="age" class="form-control" readonly>
                    </div>
                </div>
                <div class="form-group">
                    <label for="email" class="col-sm-3 control-label">Email</label>
                    <div class="col-sm-9">
                        <input type="email" name="emailid" placeholder="Email" class="form-control" name= "email" required>
                    </div>
                </div>
                <div class="form-group">
                    <label for="password" class="col-sm-3 control-label">Password</label>
                    <div class="col-sm-9">
                        <input type="password" name="password" placeholder="Password" class="form-control" required>
                    </div>
                </div>
<!--                 <div class="form-group"> -->
<!--                     <label for="password" class="col-sm-3 control-label">Confirm Password</label> -->
<!--                     <div class="col-sm-9"> -->
<!--                         <input type="password" id="password" placeholder="Password" class="form-control" required> -->
<!--                     </div> -->
<!--                 </div> -->
              
                <div class="form-group">
                    <label for="phoneNumber" class="col-sm-3 control-label">Phone number </label>
                    <div class="col-sm-9">
                        <input type="text" name="contactNumber" placeholder="Phone number" class="form-control" required>
               
                    </div>
                </div>
                <div class="form-group">
                    <label for="altphoneNumber" class="col-sm-3 control-label">Alternate Phone number </label>
                    <div class="col-sm-9">
                        <input type="text" name="altcontactNumber" placeholder="Alternate Phone number" class="form-control" required>
                       
                    </div>
                </div>
               
            
                <button type="submit" class="btn btn-primary">Register</button>
            </form> <!-- /form -->
        </div> <!-- ./container -->
        <div id="mySidebar" class="sidebar">
            <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">×</a>
            <a href="registerDoctor">Doctor Registration</a>
            <a href="registerCustomer">Customer Registration</a>
            <a class="active"href="registerAdmin">Admin Registration</a>
          </div>
          
          <div id="main">
            <button class="openbtn" onclick="openNav()">☰</button>  
           
          </div>
