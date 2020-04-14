<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title></title>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>

   <script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
   <style media="screen">
           .card {
        background-color: white;
        color: black;
        padding: 1rem;
        height: 500px;
        }

        .cards {
        max-width: 1200px;
        margin: 0 auto;
        display: grid;
        grid-gap: 1rem;
        }

        /* Screen larger than 600px? 2 column */
        @media (min-width: 0px) {
        .cards { grid-template-columns: repeat(1, 1fr); }
        }

        /* Screen larger than 900px? 3 columns */
        @media (min-width: 1200px) {
        .cards { grid-template-columns: repeat(3, 1fr); }
        }

   </style>
  </head>
  <body>
    <center><button type="button" name="button" id="btnAll" onclick="DataAllChart()">All</button><button type="button" id="btn30" name="button" onclick="Data30Chart()">1M</button><button type="button" name="button" id="btn14" onclick="Data14Chart()" style="background-color:#f20045;color:white;border:2px solid #f20045;">14D</button></center>
    <div class="cards">
      <div class="card">
        <?php

         $fourteenDaysAgo = new \DateTimeImmutable('-13 day');

         $query = "SELECT * FROM past_data WHERE date_cause >= ".$fourteenDaysAgo->format('Y-m-d');
         $today = new \DateTimeImmutable();
         $date = $fourteenDaysAgo;
         $confirm = array();
         $recover = array();
         $death = array();
         $info = mysqli_query($conn,$query);
        while($row = mysqli_fetch_assoc($info)){
             $confirmed = $row['confirmed'];
             $recovered = $row['recovered'];
             $deaths = $row['deaths'];
             $date_cause = $row['date_cause'];
             #while ($date <= $today) {
             // if there is any data for $date, add it to your dataset
             if ($date_cause == $date->format('Y-m-d')){
                 $date = $date->modify('+1 day');
                 array_push($confirm,$confirmed);
                 array_push($recover,$recovered);
                 array_push($death,$deaths);
             }
         }
        $confirm_counter = "";
        for ($i=0; $i < sizeof($confirm); $i++) {
                    $confirm_counter .= ("$confirm[$i],");
        }
          
        $recover_counter = "";
        for ($i=0; $i < sizeof($recover); $i++) {
                    $recover_counter .= ("$recover[$i],");
        }
         
        $death_counter = "";
        for ($i=0; $i < sizeof($death); $i++) {
                    $death_counter .= ("$death[$i],");
        }
        // 30 DAYS TIME GRAPH  
         $ThirtyDaysAgo = new \DateTimeImmutable('-30 day');

         $query1 = "SELECT * FROM past_data WHERE date_cause >= ".$ThirtyDaysAgo->format('Y-m-d');
         $today = new \DateTimeImmutable();
         $date = $ThirtyDaysAgo;
         $confirm1 = array();
         $recover1 = array();
         $death1 = array();
         $info1 = mysqli_query($conn,$query1);
        while($row = mysqli_fetch_assoc($info1)){
             $confirmed = $row['confirmed'];
             $recovered = $row['recovered'];
             $deaths = $row['deaths'];
             $date_cause = $row['date_cause'];
             #while ($date <= $today) {
             // if there is any data for $date, add it to your dataset
             if ($date_cause == $date->format('Y-m-d')){
                 $date = $date->modify('+1 day');
                 array_push($confirm1,$confirmed);
                 array_push($recover1,$recovered);
                 array_push($death1,$deaths);
             }
        }
          
        $confirm_counter1 = "";
        for ($i=0; $i < sizeof($confirm1); $i++) {
                    $confirm_counter1 .= ("$confirm1[$i],");
        }
          
        $recover_counter1 = "";
        for ($i=0; $i < sizeof($recover1); $i++) {
                    $recover_counter1 .= ("$recover1[$i],");
        }
         
        $death_counter1 = "";
        for ($i=0; $i < sizeof($death1); $i++) {
                    $death_counter1 .= ("$death1[$i],");
        }
        //ALL-TIME DATA GRAPH  
         $query_all = "SELECT * FROM past_data WHERE date_cause >'2020-01-30'";
         $confirm_all = array();
         $recover_all = array();
         $death_all = array();
         $all_date = array();
         $info_all = mysqli_query($conn,$query_all);
        while($row = mysqli_fetch_assoc($info_all)){
             $confirmed = $row['confirmed'];
             $recovered = $row['recovered'];
             $deaths = $row['deaths'];
             $date_cause = $row['date_cause'];
             $date_cause1 = date("M-d", strtotime($date_cause));
             array_push($all_date,$date_cause1);
             array_push($confirm_all,$confirmed);
             array_push($recover_all,$recovered);
             array_push($death_all,$deaths);
        }
        
        $day_counter_all = "";
                        for ($i=0; $i < sizeof($all_date); $i++) {
                          $day_counter_all .= ("'$all_date[$i]',");
                        }
        $confirm_counter_all = "";
        for ($i=0; $i < sizeof($confirm_all); $i++) {
                    $confirm_counter_all .= ("$confirm_all[$i],");
        }  
        $recover_counter_all = "";
        for ($i=0; $i < sizeof($recover_all); $i++) {
                    $recover_counter_all .= ("$recover_all[$i],");
        }
         
        $death_counter_all = "";
        for ($i=0; $i < sizeof($death_all); $i++) {
                    $death_counter_all .= ("$death_all[$i],");
        }
         ?>

          <canvas id="confirmed14" width="0" height="0"></canvas>
           <script>
               var ctx = document.getElementById('confirmed14').getContext('2d');
               var chart = new Chart(ctx, {
                   // The type of chart we want to create
                   type: 'line',

                   // The data for our dataset
                   data: {
                       labels: [moment().subtract(13, 'days').format('MMM D'),moment().subtract(12, 'days').format('MMM D'),moment().subtract(11, 'days').format('MMM D'),moment().subtract(10, 'days').format('MMM D'),moment().subtract(9, 'days').format('MMM D'),moment().subtract(8, 'days').format('MMM D'),moment().subtract(7, 'days').format('MMM D'),moment().subtract(6, 'days').format('MMM D'),moment().subtract(5, 'days').format('MMM D'),moment().subtract(4, 'days').format('MMM D'),moment().subtract(3, 'days').format('MMM D'),moment().subtract(2, 'days').format('MMM D'),moment().subtract(1, 'days').format('MMM D'),moment().format('MMM D')],
                       datasets: [{
                           label: 'COVID-CONFIRMED',
                           backgroundColor: '',
                           borderColor: 'rgb(255,99,132)',
                           data: [<?php echo $confirm_counter;?>]
                       }]
                   },

                   // Configuration options go here
                   options: {
                       scales: {
                           xAxes: [{
                               scaleLabel: {
                       display: true,
                       labelString: '14-DAYS'
                     },
                   ticks: {
                       autoSkip: true,
                       maxTicksLimit: 8
                               }
                           }]

                       },
                       title: {
                               display: true,
                               text: 'PATIENT CONFIRMED PRESENTATION'
                           }
                   }
                });
           </script>
           <canvas id="confirmed30" width="0" height="0" style="display:none;"></canvas>
             <script>
             var ctx = document.getElementById('confirmed30').getContext('2d');
             var chart = new Chart(ctx, {
                 // The type of chart we want to create
                 type: 'line',

                 // The data for our dataset
                 data: {
                     labels: [moment().subtract(30, 'days').format('MMM D'),moment().subtract(29, 'days').format('MMM D'),moment().subtract(28, 'days').format('MMM D'),moment().subtract(27, 'days').format('MMM D'),moment().subtract(26, 'days').format('MMM D'),moment().subtract(25, 'days').format('MMM D'),moment().subtract(24, 'days').format('MMM D'),moment().subtract(23, 'days').format('MMM D'),moment().subtract(22, 'days').format('MMM D'),moment().subtract(21, 'days').format('MMM D'),moment().subtract(20, 'days').format('MMM D'),moment().subtract(19, 'days').format('MMM D'),moment().subtract(18, 'days').format('MMM D'),moment().subtract(17, 'days').format('MMM D'),moment().subtract(16, 'days').format('MMM D'),moment().subtract(15, 'days').format('MMM D'),moment().subtract(14, 'days').format('MMM D'),moment().subtract(13, 'days').format('MMM D'),moment().subtract(12, 'days').format('MMM D'),moment().subtract(11, 'days').format('MMM D'),moment().subtract(10, 'days').format('MMM D'),moment().subtract(9, 'days').format('MMM D'),moment().subtract(8, 'days').format('MMM D'),moment().subtract(7, 'days').format('MMM D'),moment().subtract(6, 'days').format('MMM D'),moment().subtract(5, 'days').format('MMM D'),moment().subtract(4, 'days').format('MMM D'),moment().subtract(3, 'days').format('MMM D'),moment().subtract(2, 'days').format('MMM D'),moment().subtract(1, 'days').format('MMM D'),moment().format('MMM D')],
                     datasets: [{
                         label: 'COVID-CONFIRMED',
                         backgroundColor: '',
                         borderColor: 'rgb(255,99,132)',
                         data: [<?php echo $confirm_counter1;?>]
                     }]
                 },

                 // Configuration options go here
                 options: {
                     scales: {
                         xAxes: [{
                             scaleLabel: {
                     display: true,
                     labelString: '30-DAYS'
                   },
                 ticks: {
                     autoSkip: true,
                     maxTicksLimit: 7
                             }
                         }]

                     },
                     title: {
                             display: true,
                             text: 'PATIENT CONFIRMED PRESENTATION'
                         }
                 }
             });
             </script>
      <canvas id="confirmedAll" width="0" height="0" style="display:none;"></canvas>
           <script>
               var ctx = document.getElementById('confirmedAll').getContext('2d');
               var chart = new Chart(ctx, {
                   // The type of chart we want to create
                   type: 'line',

                   // The data for our dataset
                   data: {
                       labels: [<?php echo $day_counter_all;?>],
                       datasets: [{
                           label: 'COVID-CONFIRMED',
                           backgroundColor: '',
                           borderColor: 'rgb(255,99,132)',
                           data: [<?php echo $confirm_counter_all;?>]
                       }]
                   },

                   // Configuration options go here
                   options: {
                       scales: {
                           xAxes: [{
                               scaleLabel: {
                       display: true,
                       labelString: 'ALL-DAYS'
                     },
                   ticks: {
                       autoSkip: true,
                       maxTicksLimit: 8
                               }
                           }]

                       },
                       title: {
                               display: true,
                               text: 'PATIENT CONFIRMED PRESENTATION'
                           }
                   }
                });
           </script>

      </div>
      <div class="card">
            <canvas id="recovered14" width="0" height="0"></canvas>
                <script>
                var ctx = document.getElementById('recovered14').getContext('2d');
                var chart = new Chart(ctx, {
                    // The type of chart we want to create
                    type: 'line',

                    // The data for our dataset
                    data: {
                        labels: [moment().subtract(13, 'days').format('MMM D'),moment().subtract(12, 'days').format('MMM D'),moment().subtract(11, 'days').format('MMM D'),moment().subtract(10, 'days').format('MMM D'),moment().subtract(9, 'days').format('MMM D'),moment().subtract(8, 'days').format('MMM D'),moment().subtract(7, 'days').format('MMM D'),moment().subtract(6, 'days').format('MMM D'),moment().subtract(5, 'days').format('MMM D'),moment().subtract(4, 'days').format('MMM D'),moment().subtract(3, 'days').format('MMM D'),moment().subtract(2, 'days').format('MMM D'),moment().subtract(1, 'days').format('MMM D'),moment().format('MMM D')],
                        datasets: [{
                            label: 'COVID-RECOVERED',
                            backgroundColor: '',
                            borderColor: 'rgb(132, 255, 132)',
                            data: [<?php echo $recover_counter;?>]
                        }]
                    },

                    // Configuration options go here
                    options: {
                        scales: {
                            xAxes: [{
                                scaleLabel: {
                        display: true,
                        labelString: '14-DAYS'
                      },
                    ticks: {
                        autoSkip: true,
                        maxTicksLimit: 8
                                }
                            }]
                        },
                        title: {
                                display: true,
                                text: 'PATIENT RECOVERED PRESENTATION'
                            }
                    }
                });
                </script>
            <canvas id="recovered30" width="0" height="0" style="display:none;"></canvas>
                      <script>
                      var ctx = document.getElementById('recovered30').getContext('2d');
                      var chart = new Chart(ctx, {
                          // The type of chart we want to create
                          type: 'line',

                          // The data for our dataset
                          data: {
                              labels: [moment().subtract(30, 'days').format('MMM D'),moment().subtract(29, 'days').format('MMM D'),moment().subtract(28, 'days').format('MMM D'),moment().subtract(27, 'days').format('MMM D'),moment().subtract(26, 'days').format('MMM D'),moment().subtract(25, 'days').format('MMM D'),moment().subtract(24, 'days').format('MMM D'),moment().subtract(23, 'days').format('MMM D'),moment().subtract(22, 'days').format('MMM D'),moment().subtract(21, 'days').format('MMM D'),moment().subtract(20, 'days').format('MMM D'),moment().subtract(19, 'days').format('MMM D'),moment().subtract(18, 'days').format('MMM D'),moment().subtract(17, 'days').format('MMM D'),moment().subtract(16, 'days').format('MMM D'),moment().subtract(15, 'days').format('MMM D'),moment().subtract(14, 'days').format('MMM D'),moment().subtract(13, 'days').format('MMM D'),moment().subtract(12, 'days').format('MMM D'),moment().subtract(11, 'days').format('MMM D'),moment().subtract(10, 'days').format('MMM D'),moment().subtract(9, 'days').format('MMM D'),moment().subtract(8, 'days').format('MMM D'),moment().subtract(7, 'days').format('MMM D'),moment().subtract(6, 'days').format('MMM D'),moment().subtract(5, 'days').format('MMM D'),moment().subtract(4, 'days').format('MMM D'),moment().subtract(3, 'days').format('MMM D'),moment().subtract(2, 'days').format('MMM D'),moment().subtract(1, 'days').format('MMM D'),moment().format('MMM D')],
                              datasets: [{
                                  label: 'COVID-RECOVERED',
                                  backgroundColor: '',
                                  borderColor: 'rgb(132, 255, 132)',
                                  data: [<?php echo $recover_counter1;?>]
                              }]
                          },

                          // Configuration options go here
                          options: {
                              scales: {
                                  xAxes: [{
                                      scaleLabel: {
                              display: true,
                              labelString: '30-DAYS'
                            },
                          ticks: {
                              autoSkip: true,
                              maxTicksLimit: 8
                                      }
                                  }]
                              },
                              title: {
                                      display: true,
                                      text: 'PATIENT RECOVERED PRESENTATION'
                                  }
                          }
                      });
                      </script>
            <canvas id="recoveredAll" width="0" height="0" style="display:none;"></canvas>
           <script>
               var ctx = document.getElementById('recoveredAll').getContext('2d');
               var chart = new Chart(ctx, {
                   // The type of chart we want to create
                   type: 'line',

                   // The data for our dataset
                   data: {
                       labels: [<?php echo $day_counter_all;?>],
                       datasets: [{
                           label: 'COVID-RECOVERED',
                           backgroundColor: '',
                           borderColor: 'rgb(132, 255, 132)',
                           data: [<?php echo $recover_counter_all;?>]
                       }]
                   },

                   // Configuration options go here
                   options: {
                       scales: {
                           xAxes: [{
                               scaleLabel: {
                       display: true,
                       labelString: 'ALL-DAYS'
                     },
                   ticks: {
                       autoSkip: true,
                       maxTicksLimit: 8
                               }
                           }]

                       },
                       title: {
                               display: true,
                               text: 'PATIENT RECOVERED PRESENTATION'
                           }
                   }
                });
           </script>
      </div>
      <div class="card">
          <canvas id="deaths14" width="0" height="0"></canvas>
              <script>
              var ctx = document.getElementById('deaths14').getContext('2d');
              var chart = new Chart(ctx, {
                  // The type of chart we want to create
                  type: 'line',

                  // The data for our dataset
                  data: {
                      labels: [moment().subtract(13, 'days').format('MMM D'),moment().subtract(12, 'days').format('MMM D'),moment().subtract(11, 'days').format('MMM D'),moment().subtract(10, 'days').format('MMM D'),moment().subtract(9, 'days').format('MMM D'),moment().subtract(8, 'days').format('MMM D'),moment().subtract(7, 'days').format('MMM D'),moment().subtract(6, 'days').format('MMM D'),moment().subtract(5, 'days').format('MMM D'),moment().subtract(4, 'days').format('MMM D'),moment().subtract(3, 'days').format('MMM D'),moment().subtract(2, 'days').format('MMM D'),moment().subtract(1, 'days').format('MMM D'),moment().format('MMM D')],
                      datasets: [{
                          label: 'COVID-DEATHS',
                          backgroundColor: '',
                          borderColor: 'rgb(255, 199, 99)',
                          data: [<?php echo $death_counter;?>]
                      }]
                  },

                  // Configuration options go here
                  options: {
                      scales: {
                          xAxes: [{
                              scaleLabel: {
                      display: true,
                      labelString: '14-DAYS'
                    },
                  ticks: {
                      autoSkip: true,
                      maxTicksLimit: 8
                              }
                          }]
                      },
                      title: {
                              display: true,
                              text: 'PATIENT DEATH PRESENTATION'
                          }
                  }
              });
              </script>
          <canvas id="deaths30" width="0" height="0" style="display:none;"></canvas>
                    <script>
                    var ctx = document.getElementById('deaths30').getContext('2d');
                    var chart = new Chart(ctx, {
                        // The type of chart we want to create
                        type: 'line',

                        // The data for our dataset
                        data: {
                            labels: [moment().subtract(30, 'days').format('MMM D'),moment().subtract(29, 'days').format('MMM D'),moment().subtract(28, 'days').format('MMM D'),moment().subtract(27, 'days').format('MMM D'),moment().subtract(26, 'days').format('MMM D'),moment().subtract(25, 'days').format('MMM D'),moment().subtract(24, 'days').format('MMM D'),moment().subtract(23, 'days').format('MMM D'),moment().subtract(22, 'days').format('MMM D'),moment().subtract(21, 'days').format('MMM D'),moment().subtract(20, 'days').format('MMM D'),moment().subtract(19, 'days').format('MMM D'),moment().subtract(18, 'days').format('MMM D'),moment().subtract(17, 'days').format('MMM D'),moment().subtract(16, 'days').format('MMM D'),moment().subtract(15, 'days').format('MMM D'),moment().subtract(14, 'days').format('MMM D'),moment().subtract(13, 'days').format('MMM D'),moment().subtract(12, 'days').format('MMM D'),moment().subtract(11, 'days').format('MMM D'),moment().subtract(10, 'days').format('MMM D'),moment().subtract(9, 'days').format('MMM D'),moment().subtract(8, 'days').format('MMM D'),moment().subtract(7, 'days').format('MMM D'),moment().subtract(6, 'days').format('MMM D'),moment().subtract(5, 'days').format('MMM D'),moment().subtract(4, 'days').format('MMM D'),moment().subtract(3, 'days').format('MMM D'),moment().subtract(2, 'days').format('MMM D'),moment().subtract(1, 'days').format('MMM D'),moment().format('MMM D')],
                            datasets: [{
                                label: 'COVID-DEATHS',
                                backgroundColor: '',
                                borderColor: 'rgb(255, 199, 99)',
                                data: [<?php echo $death_counter1;?>]
                            }]
                        },

                        // Configuration options go here
                        options: {
                            scales: {
                                xAxes: [{
                                    scaleLabel: {
                            display: true,
                            labelString: '30-DAYS'
                          },
                        ticks: {
                            autoSkip: true,
                            maxTicksLimit: 8
                                    }
                                }]
                            },
                            title: {
                                    display: true,
                                    text: 'PATIENT DEATH PRESENTATION'
                                }
                        }
                    });
                    </script>
                <canvas id="deathAll" width="0" height="0" style="display:none;"></canvas>
           <script>
               var ctx = document.getElementById('deathAll').getContext('2d');
               var chart = new Chart(ctx, {
                   // The type of chart we want to create
                   type: 'line',

                   // The data for our dataset
                   data: {
                       labels: [<?php echo $day_counter_all;?>],
                       datasets: [{
                           label: 'COVID-DEATH',
                           backgroundColor: '',
                           borderColor: 'rgb(255, 199, 99)',
                           data: [<?php echo $death_counter_all;?>]
                       }]
                   },

                   // Configuration options go here
                   options: {
                       scales: {
                           xAxes: [{
                               scaleLabel: {
                       display: true,
                       labelString: 'ALL-DAYS'
                     },
                   ticks: {
                       autoSkip: true,
                       maxTicksLimit: 8
                               }
                           }]

                       },
                       title: {
                               display: true,
                               text: 'PATIENT DEATH PRESENTATION'
                           }
                   }
                });
           </script>
      </div>
    </div>
    <br>

    <script type="text/javascript">
        $("#btnAll").css({"background-color": "#f20045","color" : "white","border":"2px solid #f20045"});
        function Data30Chart() {
          $("#btn30").css({"background-color": "#f20045","color" : "white","border":"2px solid #f20045"});
          $("#btn14").css({"background-color": "#B8B8B8","color" : "black","border":"2px solid #B8B8B8"});
          $("#btnAll").css({"background-color": "#B8B8B8","color" : "black","border":"2px solid #B8B8B8"});
          $("#recovered14").hide("fast");
          $("#deaths14").hide("fast");
          $("#confirmed14").hide("fast");
          $("#confirmedAll").hide("fast");
          $("#recoveredAll").hide("fast");
          $("#deathAll").hide("fast");
          $("#recovered30").show("fast");
          $("#deaths30").show("fast");
          $("#confirmed30").show("fast");
        }
        function Data14Chart() {
          $("#btn14").css({"background-color": "#f20045","color" : "white","border":"2px solid #f20045"});
          $("#btn30").css({"background-color": "#B8B8B8","color" : "black","border":"2px solid #B8B8B8"});
          $("#btnAll").css({"background-color": "#B8B8B8","color" : "black","border":"2px solid #B8B8B8"});
          $("#recovered30").hide("fast");
          $("#deaths30").hide("fast");
          $("#confirmed30").hide("fast");
          $("#confirmedAll").hide("fast");
          $("#recoveredAll").hide("fast");
          $("#deathAll").hide("fast");
          $("#recovered14").show("fast");
          $("#deaths14").show("fast");
          $("#confirmed14").show("fast");
        }
        function DataAllChart(){
          $("#btnAll").css({"background-color": "#f20045","color" : "white","border":"2px solid #f20045"});
          $("#btn30").css({"background-color": "#B8B8B8","color" : "black","border":"2px solid #B8B8B8"});
          $("#btn14").css({"background-color": "#B8B8B8","color" : "black","border":"2px solid #B8B8B8"});
          $("#recovered30").hide("fast");
          $("#deaths30").hide("fast");
          $("#confirmed30").hide("fast");
          $("#recovered14").hide("fast");
          $("#deaths14").hide("fast");
          $("#confirmed14").hide("fast");
          $("#recoveredAll").show("fast");
          $("#deathAll").show("fast");
          $("#confirmedAll").show("fast");
        }
    </script>

    <hr>
    <div class="cards">
      <div class="card">
        <?php
            $query1 = "SELECT male AS `male` FROM gender";
            $res_1=mysqli_query($conn,$query1);
            $data_1=mysqli_fetch_array($res_1);

            $query2 = "SELECT female AS `female` FROM gender";
            $res_2=mysqli_query($conn,$query2);
            $data_2=mysqli_fetch_array($res_2);

            $query3 = "SELECT awaiting AS `await` FROM gender";
            $res_3=mysqli_query($conn,$query3);
            $data_3=mysqli_fetch_array($res_3);

            $count_male = $data_1['male'];
            $count_female = $data_2['female'];
            $count_await = $data_3['await'];
        ?>
        <canvas id="myChart4" height="0px" width="0px"></canvas>
        <script>
                var ctx1 = document.getElementById('myChart4').getContext('2d');
                var myPieChart = new Chart(ctx1, {
                    type: 'doughnut',
                    data : {
                    datasets: [{
                    backgroundColor: ["#414df2","#f540ff","#8d839c"],
                    data: [<?php echo $count_male;?>,<?php echo $count_female;?>,<?php echo $count_await;?>]
                }],

        // These labels appear in the legend and in the tooltips when hovering different arcs
                labels: [
                    'Male',
                    'Female',
                    'Awaiting'
                    ]
                                  },
                  options: {
                          title: {
                              display: true,
                              text: 'PATIENT GENDER PRESENTATION'
                          }
                  }
            });
            </script>
      </div>
      <div class="card">
        <?php
               $query1 = "SELECT counts AS `counts` FROM age WHERE age_range = '0-10'";
               $res_1=mysqli_query($conn,$query1);
               $data_1=mysqli_fetch_array($res_1);
               $count1 = $data_1['counts'];

               $query2 = "SELECT counts AS `counts` FROM age WHERE age_range = '11-20'";
               $res_2=mysqli_query($conn,$query2);
               $data_2=mysqli_fetch_array($res_2);
               $count2 = $data_2['counts'];

               $query3 = "SELECT counts AS `counts` FROM age WHERE age_range = '21-30'";
               $res_3=mysqli_query($conn,$query3);
               $data_3=mysqli_fetch_array($res_3);
               $count3 = $data_3['counts'];

               $query4 = "SELECT counts AS `counts` FROM age WHERE age_range = '31-40'";
               $res_4=mysqli_query($conn,$query4);
               $data_4=mysqli_fetch_array($res_4);
               $count4 = $data_4['counts'];

               $query5 = "SELECT counts AS `counts` FROM age WHERE age_range = '41-50'";
               $res_5=mysqli_query($conn,$query5);
               $data_5=mysqli_fetch_array($res_5);
               $count5 = $data_5['counts'];

               $query6 = "SELECT counts AS `counts` FROM age WHERE age_range = '51-60'";
               $res_6=mysqli_query($conn,$query6);
               $data_6=mysqli_fetch_array($res_6);
               $count6 = $data_6['counts'];

               $query7 = "SELECT counts AS `counts` FROM age WHERE age_range = '61-70'";
               $res_7=mysqli_query($conn,$query7);
               $data_7=mysqli_fetch_array($res_7);
               $count7 = $data_7['counts'];

               $query8 = "SELECT counts AS `counts` FROM age WHERE age_range = '71-80'";
               $res_8=mysqli_query($conn,$query8);
               $data_8=mysqli_fetch_array($res_8);
               $count8 = $data_8['counts'];

               $query9 = "SELECT counts AS `counts` FROM age WHERE age_range = '81-90'";
               $res_9=mysqli_query($conn,$query9);
               $data_9=mysqli_fetch_array($res_9);
               $count9 = $data_9['counts'];

               $query10 = "SELECT counts AS `counts` FROM age WHERE age_range = '91-100'";
               $res_10=mysqli_query($conn,$query10);
               $data_10=mysqli_fetch_array($res_10);
               $count10 = $data_10['counts'];

               $query11 = "SELECT counts AS `counts` FROM age WHERE age_range = '100+'";
               $res_11=mysqli_query($conn,$query11);
               $data_11=mysqli_fetch_array($res_11);
               $count11 = $data_11['counts'];

               $query12 = "SELECT counts AS `counts` FROM age WHERE age_range = 'awaiting'";
               $res_12=mysqli_query($conn,$query12);
               $data_12=mysqli_fetch_array($res_12);
               $count12 = $data_12['counts'];
             ?>
         <canvas id="myChart5" height="0" width="0"></canvas>
       <script>
       var ctx = document.getElementById('myChart5').getContext('2d');
       var myChart = new Chart(ctx, {
           type: 'bar',
           data: {
               labels: ['0-10', '11-20', '21-30', '31-40', '41-50', '51-60', '61-70', '71-80', '81-90', '91-100','100+'],
               datasets: [{
                   label: 'PATIENT AGE(RANGES)',
                   data: [<?php echo $count1;?>,<?php echo $count2;?>,<?php echo $count3;?>,<?php echo $count4;?>,<?php echo $count5;?>,<?php echo $count6;?>,<?php echo $count7;?>,<?php echo $count8;?>,<?php echo $count9;?>,<?php echo $count10;?>,<?php echo $count11;?>],
                   backgroundColor: [
                       'rgba(227, 5, 5,0.7)',
                       'rgba(227, 5, 5,0.7)',
                       'rgba(227, 5, 5,0.7)',
                       'rgba(227, 5, 5,1)',
                       'rgba(227, 5, 5,0.7)',
                       'rgba(227, 5, 5,0.7)',
                       'rgba(227, 5, 5,0.7)',
                       'rgba(227, 5, 5,0.7)',
                       'rgba(227, 5, 5,0.7)',
                       'rgba(227, 5, 5,0.7)',
                       'rgba(227, 5, 5,0.7)',
                   ],
                   borderColor: [
                       'rgba(0,0,0,1)',
                       'rgba(0,0,0,1)',
                       'rgba(0,0,0,1)',
                       'rgba(0,0,0,1)',
                       'rgba(0,0,0,1)',
                       'rgba(0,0,0,1)',
                       'rgba(0,0,0,1)',
                       'rgba(0,0,0,1)',
                       'rgba(0,0,0,1)',
                       'rgba(0,0,0,1)',
                       'rgba(0,0,0,1)',
                   ],
                   borderWidth: 1
               }]
           },
           options: {
               title: {
                       display: true,
                       text: 'PATIENT AGE PRESENTATION'
                   },
               scales: {
                   xAxes: [{
                       scaleLabel: {
                           display: true,
                           labelString: "*Awaiting details for <?php echo $count12;?> Patients"
                   }
               }]
           }
           }
       });
       </script>
      </div>
      <div class="card">
                  <?php
                $query = "SELECT * FROM nationality_count";
                $nation_count = array();
                $nation_name = array();
                $info = mysqli_query($conn,$query);
                while($row = mysqli_fetch_assoc($info)){
                    $nation = $row['nationality'];
                    $count = $row['count'];
                    #while ($date <= $today) {
                    // if there is any data for $date, add it to your datase
                    array_push($nation_count,$count);
                    array_push($nation_name,$nation);
                    }

                        $label = "";
                        for ($i=0; $i < sizeof($nation_name); $i++) {
                          $label .= ("'$nation_name[$i]',");
                        }
                        $nation_counter = "";
                        for ($i=0; $i < sizeof($nation_count); $i++) {
                          $nation_counter .= ("$nation_count[$i],");
                        }




          ?>
           <canvas id="myChart9" height="0" width="0"></canvas>
                <script>
                    var ctx1 = document.getElementById('myChart9').getContext('2d');
                    var myPieChart = new Chart(ctx1, {
                        type: 'doughnut',
                        data : {
                        datasets: [{
                        backgroundColor: ["#fa437a","#de6a0b","#8d839c","#32e361","#37ddf0","#3750f0","#9a57de","#f564e6","#f048aa","#ed2860","#93e349","#e0dc5e"],
                        data: [<?php echo $nation_counter ?>]
                    }],



            // These labels appear in the legend and in the tooltips when hovering different arcs
                    labels: [
                        <?php echo $label; ?>
                    ]
                            },
            options: {
                    title: {
                        display: true,
                        text: 'PATIENT NATIONALITY PRESENTATION'
                    }
            }
          });
          </script>
      </div>
      <!-- <div class="card">FOUR</div> -->
    </div>

  </body>
</html>
