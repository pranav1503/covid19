<?php include 'db.php';?>
<?php
date_default_timezone_set('Asia/Kolkata');

function date_diff_str($lu)
{
  $diff_total = strtotime(date('Y-m-d H:i:s')) - $lu;

  if(intdiv($diff_total,60)<60){
    $diff_str = intdiv($diff_total,60)." Minutes Ago";
  }elseif (intdiv($diff_total,3600)<24) {
    $diff_str = intdiv($diff_total,3600)." Hours Ago";
  }else{
    $diff_str = intdiv($diff_total,86400)." Days Ago";
  }
  return $diff_str;
}

$sql = "SELECT * FROM total where id=1";
$result = $conn->query($sql);
      if ($result->num_rows > 0) {
          while($row = $result->fetch_assoc()) {
              $total = $row['total'];
              $active = $row['active'];
              $recovered = $row['recovered'];
              $deaths = $row['deaths'];
              $itotal = $row['itotal'];
              $irecovered = $row['irecovered'];
              $ideaths = $row['ideaths'];
              $last_update = $row['last_update'];
              $last_update = strtotime($last_update);
              $last_update_str = date("d M, H:i", $last_update);
          }
      }
      $total_down = $total;
      $active_down = $active;
      $recovered_down = $recovered;
      $deaths_down = $deaths;
      if($itotal != 0){
        $total = $total."[+".$itotal."]";
      }
      if($irecovered != 0){
        $recovered = $recovered."[+".$irecovered."]";
      }
      if($ideaths != 0){
        $deaths = $deaths."[+".$ideaths."]";
      }

      $diff_str = date_diff_str($last_update);
 ?>

<!DOCTYPE html>
<html class="no-js" lang="en">
<head>
    <!--- basic page needs
    ================================================== -->
    <meta charset="utf-8">
    <title>Covid19Tracker</title>
    <meta name="description" content="">
    <meta name="author" content="">

    <!-- mobile specific metas
    ================================================== -->
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- CSS
    ================================================== -->
    <link rel="stylesheet" href="css/base.css">
    <link rel="stylesheet" href="css/vendor.css">
    <link rel="stylesheet" href="css/main.css">

    <!-- script
    ================================================== -->
    <script src="js/modernizr.js"></script>
    <script src="js/pace.min.js"></script>

    <!-- favicons
    ================================================== -->
    <link rel="shortcut icon" href="favicon.ico" type="image/x-icon">
    <link rel="icon" href="favicon.ico" type="image/x-icon">
    <style media="screen">
    .rowmy::after {
      content: "";
      clear: both;
      display: table;
    }

        [class*="colmy-"] {
        float: left;
        padding: 0px;
        /* border: 1px solid red; */
        }

        .colmy-1 {width: 8.33%;}
        .colmy-2 {width: 16.66%;}
        .colmy-3 {width: 25%;}
        .colmy-4 {width: 33.33%;}
        .colmy-5 {width: 41.66%;}
        .colmy-6 {width: 50%;}
        .colmy-7 {width: 58.33%;}
        .colmy-8 {width: 66.66%;}
        .colmy-9 {width: 75%;}
        .colmy-10 {width: 83.33%;}
        .colmy-11 {width: 91.66%;}
        .colmy-12 {width: 100%;}

      /* .mob-state{
        display: none;
      } */
    @media screen and (min-width: 1000px) {
        .whatsapp{
            display: none;
        }
  }
    </style>

</head>

<body id="top">

    <!-- header
    ================================================== -->
    <header class="s-header">

        <div class="header-logo">
            <a class="site-logo" href="">
                <img src="images/logo_new.png" style="height:250px;width:250px;" alt="Homepage">
                <!-- <h3 style="color:white;">Covid-19 Tracker</h3> -->
            </a>
        </div> <!-- end header-logo -->

        <nav class="header-nav">

            <a href="#0" class="header-nav__close" title="close"><span>Close</span></a>

            <div class="header-nav__content">
                <h3>Covid-19 Tracker</h3>

                <ul class="header-nav__list">
                    <li class="current"><a class="smoothscroll"  href="#home" title="home">Home</a></li>
                    <li><a class="smoothscroll"  href="#state" title="about">State Data</a></li>
                    <li><a class="smoothscroll"  href="#statistics" title="services">Statistical Data</a></li>
                    <li><a class="smoothscroll"  href="#help" title="works">Helpful Links</a></li>
                    <li><a  href="https://www.covid19india.org/" target="_blank" title="contact">More Details</a></li>
                    <li class="whatsapp"><a  href="https://api.whatsapp.com/send?phone=919013151515&text=Namaste&source=&data=" target="_blank" title="contact">WhatsApp Queieres</a></li>
                </ul>

                <!-- <p>Perspiciatis hic praesentium nesciunt. Et neque a dolorum <a href='#0'>voluptatem</a> porro iusto sequi veritatis libero enim. Iusto id suscipit veritatis neque reprehenderit.</p> -->

                <ul class="header-nav__social">
                    <li>
                        <a href="#0"><i class="fab fa-facebook"></i></a>
                    </li>
                    <li>
                        <a href="#0"><i class="fab fa-twitter"></i></a>
                    </li>
                    <li>
                        <a href="#0"><i class="fab fa-instagram"></i></a>
                    </li>
                    <li>
                        <a href="#0"><i class="fab fa-behance"></i></a>
                    </li>
                    <li>
                        <a href="#0"><i class="fab fa-dribbble"></i></a>
                    </li>
                </ul>

            </div> <!-- end header-nav__content -->

        </nav> <!-- end header-nav -->

        <a class="header-menu-toggle" href="#0">
            <span class="header-menu-icon"></span>
        </a>

    </header> <!-- end s-header -->


    <!-- home
    ================================================== -->
    <section id="home" class="s-home target-section" data-parallax="scroll" data-image-src="images/hero-bg.jpg" data-natural-width=3000 data-natural-height=2000 data-position-y=top>

        <div class="shadow-overlay"></div>

        <div class="home-content">

            <div class="row home-content__main">
                <h1 style="color:white;">
                  Covid-19 Tracker India
                  <!-- India -->
                </h1>
                <p style="font-size:20px;display:none;color:green;margin:0">
                </p>
                <p style="font-size:20px;color:green;margin:0;">
                Last Updated:<br> <?php echo $last_update_str; ?> IST
                </p>
                <p style="font-size:20px;color:green;margin:0">
                  (<?php echo $diff_str; ?>)
                </p>
                <div class="rowmy">
                  <div class="colmy-6">
                    <h3 style="color:white;">Total: <br><span style="color:red;" class="counta"><?php echo $total; ?></h3>
                  </div>
                  <div class="colmy-6">
                    <h3 style="color:white;">Active:<br> <span style="color:#4287f5;" class="counta"><?php echo $active; ?></span></h3>
                  </div>
                </div>
                <div class="rowmy">
                  <div class="colmy-6">
                    <h3 style="color:white;">Recovered:<br> <span style="color:#3bff38;" class="counta"><?php echo $recovered; ?></span></h3>
                  </div>
                  <div class="colmy-6">
                    <h3 style="color:white;">Deceased:<br> <span style="color:#ff9b3d;" class="counta"><?php echo $deaths; ?></span></h3>
                  </div>
                </div>

        </div> <!-- end home-content -->

        <ul class="home-sidelinks">
            <li><a class="smoothscroll" href="#state">State Data<span>District wise included</span></a></li>
            <li><a  href="https://www.mohfw.gov.in/" target="_blank">More Details<span>https://www.mohfw.gov.in/</span></a></li>
            <li><a  href="#contact" target="_blank">Global Data<span>https://coronavirus.thebaselab.com/</span></a></li>
        </ul> <!-- end home-sidelinks -->

        <ul class="home-social">
            <li class="home-social-title">Follow Us</li>
            <li><a href="#0">
                <i class="fab fa-facebook"></i>
                <span class="home-social-text">Facebook</span>
            </a></li>
            <li><a href="#0">
                <i class="fab fa-twitter"></i>
                <span class="home-social-text">Twitter</span>
            </a></li>
            <li><a href="#0">
                <i class="fab fa-linkedin"></i>
                <span class="home-social-text">LinkedIn</span>
            </a></li>
        </ul> <!-- end home-social -->

        <a href="#state" class="home-scroll smoothscroll">
            <span class="home-scroll__text">Scroll Down</span>
            <span class="home-scroll__icon"></span>
        </a> <!-- end home-scroll -->

    </section> <!-- end s-home -->


    <!-- about
    ================================================== -->
    <section id='state' class="s-about">

        <div class="row section-header" data-aos="fade-up">
            <div class="col-full">
                <p>The data provided and compiled by <a href="https://www.covid19india.org/" style="color:dodgerblue;">Covid19India</a> using state bulletins and official handles to update the numbers. The data is validated by a group of volunteers and published into a Google sheet and an API.</p>
                <h3 class="subhead">States and Union Territories</h3>
                <p>**Click on the state for district details</p>
            </div>
        </div>


        <div id="state-div"  data-aos="fade-up" style="overflow-y:scroll;">
            <div class="col-full">
                <?php
                 include 'states.php';
                  ?>
            </div>
            <script type="text/javascript">
                var element = document.getElementById("state-div");
                element.classList.remove("row");
                if(screen.width > 1200){
                  element.classList.add("row");
                }
            </script>
        </div>

    </section>

    <!-- <section id='about' class="s-about">
        <div class="row section-header" data-aos="fade-up">
            <div class="col-full">
                <h3 class="subhead">Who We Are</h3>
                <h1 class="display-1">We are a group of design driven individuals passionate about creating beautiful UI designs.</h1>
            </div>
        </div>
        <div class="row" data-aos="fade-up">
            <div class="col-full">
                <p class="lead">
                Curabitur arcu erat, accumsan id imperdiet et, porttitor at sem. Donec rutrum congue leo eget malesuada. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse.
                </p>
            </div>
        </div>
        <div class="row">
            <div class="about-process process block-1-2 block-tab-full">
                <div class="process__vline-left"></div>
                <div class="process__vline-right"></div>
                <div class="col-block process__col" data-item="1" data-aos="fade-up">
                    <div class="process__text">
                        <h4>Define</h4>
                        <p>
                        Quos dolores saepe mollitia deserunt accusamus autem reprehenderit. Voluptas facere animi explicabo non quis magni recusandae.
                        Numquam debitis pariatur omnis facere unde. Laboriosam minus amet nesciunt est. Et saepe eos maxime tempore quasi deserunt ab.
                        </p>
                    </div>
                </div>
                <div class="col-block process__col" data-item="2" data-aos="fade-up">
                    <div class="process__text">
                        <h4>Design</h4>
                        <p>
                        Quos dolores saepe mollitia deserunt accusamus autem reprehenderit. Voluptas facere animi explicabo non quis magni recusandae.
                        Numquam debitis pariatur omnis facere unde. Laboriosam minus amet nesciunt est. Et saepe eos maxime tempore quasi deserunt ab.
                        </p>
                    </div>
                </div>
                <div class="col-block process__col" data-item="3" data-aos="fade-up">
                    <div class="process__text">
                        <h4>Build</h4>
                        <p>
                        Quos dolores saepe mollitia deserunt accusamus autem reprehenderit. Voluptas facere animi explicabo non quis magni recusandae.
                        Numquam debitis pariatur omnis facere unde. Laboriosam minus amet nesciunt est. Et saepe eos maxime tempore quasi deserunt ab.
                        </p>
                    </div>
                </div>
                <div class="col-block process__col" data-item="4" data-aos="fade-up">
                    <div class="process__text">
                        <h4>Launch</h4>
                        <p>
                        Quos dolores saepe mollitia deserunt accusamus autem reprehenderit. Voluptas facere animi explicabo non quis magni recusandae.
                        Numquam debitis pariatur omnis facere unde. Laboriosam minus amet nesciunt est. Et saepe eos maxime tempore quasi deserunt ab.
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </section> -->
    <!-- end s-about -->

    <!-- services
    ================================================== -->
    <section id='statistics' class="s-services light-gray">

        <div class="row section-header" data-aos="fade-up">
            <div class="col-full">
                <h3 class="subhead">Stats</h3>
                <h1 class="display-1">Statistical Information</h1>
            </div>
        </div> <!-- end section-header -->


        <div class="row services-list block-1-3 block-m-1-2 block-tab-full" data-aos="fade-up">
          <!-- CHARTS GOES HERE -->
                <?php
                    include 'stats.php';
                 ?>
        </div> <!-- end services-list -->

    </section> <!-- end s-services -->


    <!-- works
    ================================================== -->
    <section id='help' class="s-works">

        <div class="row section-header" data-aos="fade-up">
            <div class="col-full">
                <h3 class="subhead">Helpful Links</h3>
                <h1 class="display-1">Stay home and self-isolate from others in the household if you feel unwell</h1>
            </div>
        </div> <!-- end section-header -->

        <center><div class="row" data-aos="fade-up">
          <p style="font-weight:bold;padding:0;margin:0;">HELPLINE NUMBERS [BY STATE]</p>
          <p><a target="_blank" href="https://www.mohfw.gov.in/pdf/coronvavirushelplinenumber.pdf" style="padding:0;margin:0;">HTTPS://WWW.MOHFW.GOV.IN/PDF/CORONVAVIRUSHELPLINENUMBER.PDF</a></p>
          <p style="font-weight:bold;padding:0;margin:0;">WHO : COVID-19 HOME PAGE</p>
          <p><a target="_blank" href="https://www.who.int/emergencies/diseases/novel-coronavirus-2019" style="padding:0;margin:0;">HTTPS://WWW.WHO.INT/EMERGENCIES/DISEASES/NOVEL-CORONAVIRUS-2019</a></p>
          <p style="font-weight:bold;padding:0;margin:0;">MINISTRY OF HEALTH AND FAMILY WELFARE, GOV. OF INDIA</p>
          <p><a target="_blank" href="https://www.mohfw.gov.in/" style="padding:0;margin:0;">HTTPS://WWW.MOHFW.GOV.IN/</a></p>
          <p style="font-weight:bold;padding:0;margin:0;">CENTERS FOR DISEASE CONTROL AND PREVENTION</p>
          <p><a target="_blank" href="HTTPS://WWW.CDC.GOV/CORONAVIRUS/2019-NCOV/FAQ.HTML" style="padding:0;margin:0;">HTTPS://WWW.CDC.GOV/CORONAVIRUS/2019-NCOV/FAQ.HTML</a></p>
          <p style="font-weight:bold;padding:0;margin:0;">CROWDSOURCED LIST OF RESOURCES & ESSENTIALS FROM ACROSS INDIA</p>
          <p><a target="_blank" href="https://bit.ly/covid19resourcelist" style="padding:0;margin:0;">HTTPS://BIT.LY/COVID19RESOURCELIST</a></p>
        </div></center>

    </section> <!-- end s-works -->


    <!-- stats
    ================================================== -->
    <section id="stats" class="s-stats">

        <div class="row stats block-1-4 block-m-1-2 block-mob-full" data-aos="fade-up">

            <div class="col-block stats__col ">
                <div class="stats__count"><?php echo $total_down; ?></div>
                <h5>Total</h5>
            </div>
            <div class="col-block stats__col">
                <div class="stats__count"><?php echo $active_down; ?></div>
                <h5>Active</h5>
            </div>
            <div class="col-block stats__col">
                <div class="stats__count"><?php echo $recovered_down; ?></div>
                <h5>Recovered</h5>
            </div>
            <div class="col-block stats__col">
                <div class="stats__count"><?php echo $deaths_down; ?></div>
                <h5>Deaths</h5>
            </div>

        </div> <!-- end stats -->

    </section> <!-- end s-stats -->


    <!-- contact
    ================================================== -->
    <section id="contact" class="s-contact">

        <!-- <div class="row section-header" data-aos="fade-up">
            <div class="col-full">
                <h3 class="subhead subhead--light">For more details</h3>
                <h1 class="display-1 display-1--light">Visit: <a href="https://www.covid19india.org/" style="color:dodgerblue;">Covid19India.org</a> </h1>
            </div>
        </div>

        <div class="row">

            <div class="col-full contact-main" data-aos="fade-up">
                <p>
                <a href="mailto:#0" class="contact-email">hello@transcend-studio.com</a>
                <span class="contact-number">+1 (917) 123 456  /  +1 (917) 333 987</span>
                </p>
            </div>

        </div> -->

       <div class="row">

            <div class="col-five tab-full contact-secondary">
                <h3 class="subhead subhead--light">Thank you for visiting</h3>

                <p class="contact-address">
                    For Global Details: <a href="https://coronavirus.thebaselab.com/" target="_blank" style="color:dodgerblue;">Click Here</a>
                </p>
            </div>
      </div>

            <!--  <div class="col-five tab-full contact-secondary" data-aos="fade-up">
                <h3 class="subhead subhead--light">Follow Us</h3>

                <ul class="contact-social">
                    <li>
                        <a href="#0"><i class="fab fa-facebook"></i></a>
                    </li>
                    <li>
                        <a href="#0"><i class="fab fa-twitter"></i></a>
                    </li>
                    <li>
                        <a href="#0"><i class="fab fa-instagram"></i></a>
                    </li>
                    <li>
                        <a href="#0"><i class="fab fa-behance"></i></a>
                    </li>
                    <li>
                        <a href="#0"><i class="fab fa-dribbble"></i></a>
                    </li>
                </ul>

                <div class="contact-subscribe">
                    <form id="mc-form" class="group mc-form" novalidate="true">
                        <input type="email" value="" name="EMAIL" class="email" id="mc-email" placeholder="Email Address" required="">
                        <input type="submit" name="subscribe" value="Subscribe">
                        <label for="mc-email" class="subscribe-message"></label>
                    </form>
                </div>
            </div>

        </div>  -->

        <div class="row">
            <div class="col-full cl-copyright">
                <span><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="fa fa-heart" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a> and developed with passion by <a href="https://github.com/Dipropramanick1999/" style="color:white;" target="_blank">Dipro Pramanick</a> and <a href="https://github.com/pranav1503/" style="color:white;" target="_blank">Pranav S</a>
    <p>Developed as a part of <a href="https://sites.google.com/cmrit.ac.in/mozietyclub" style="color:white;" target="_blank">Moziety</a></p>
<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></span>
            </div>
        </div>

        <div class="cl-go-top">
            <a class="smoothscroll" title="Back to Top" href="#top"><i class="icon-arrow-up" aria-hidden="true"></i></a>
        </div>

    </section> <!-- end s-contact -->


    <!-- photoswipe background
    ================================================== -->
    <div aria-hidden="true" class="pswp" role="dialog" tabindex="-1">

        <div class="pswp__bg"></div>
        <div class="pswp__scroll-wrap">

            <div class="pswp__container">
                <div class="pswp__item"></div>
                <div class="pswp__item"></div>
                <div class="pswp__item"></div>
            </div>

            <div class="pswp__ui pswp__ui--hidden">
                <div class="pswp__top-bar">
                    <div class="pswp__counter"></div><button class="pswp__button pswp__button--close" title="Close (Esc)"></button> <button class="pswp__button pswp__button--share" title=
                    "Share"></button> <button class="pswp__button pswp__button--fs" title="Toggle fullscreen"></button> <button class="pswp__button pswp__button--zoom" title=
                    "Zoom in/out"></button>
                    <div class="pswp__preloader">
                        <div class="pswp__preloader__icn">
                            <div class="pswp__preloader__cut">
                                <div class="pswp__preloader__donut"></div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="pswp__share-modal pswp__share-modal--hidden pswp__single-tap">
                    <div class="pswp__share-tooltip"></div>
                </div><button class="pswp__button pswp__button--arrow--left" title="Previous (arrow left)"></button> <button class="pswp__button pswp__button--arrow--right" title=
                "Next (arrow right)"></button>
                <div class="pswp__caption">
                    <div class="pswp__caption__center"></div>
                </div>
            </div>

        </div>

    </div> <!-- end photoSwipe background -->


    <!-- preloader
    ================================================== -->
    <div id="preloader">
        <div id="loader">
        </div>
    </div>


    <!-- Java Script
    ================================================== -->
    <script src="js/jquery-3.2.1.min.js"></script>
    <script src="js/plugins.js"></script>
    <script src="js/main.js"></script>

    <script type="text/javascript">
      $('.count').each(function () {
          $(this).prop('Counter',0).animate({
              Counter: $(this).text()
          }, {
              duration: 2000,
              easing: 'swing',
              step: function (now) {
                  $(this).text(Math.ceil(now));
              }
          });
      });

    </script>
</body>

</html>
