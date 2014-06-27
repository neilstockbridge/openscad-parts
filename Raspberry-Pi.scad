
/* Measurements were made with calipers and rounded to the nearest 0.1 mm */

$fs = 0.5;

module board()
{
  board_size = [ 85, 56, 1.5 ];
  mount_hole_radius = 2.9 / 2;
  hole_1_position = [ 24.1 + mount_hole_radius,
                      16.5 + mount_hole_radius,
                    ];
  hole_2_position = [ board_size[0] - 3.5 - mount_hole_radius,
                      board_size[1] - 11 - mount_hole_radius,
                    ];
  leave_space_under = 3.7; // mm tallest component raised away from bottom surface of board
  cpu_size = [ 12, 12, 1.3 ];
  cpu_position = [ board_size[0] + 7.1 - 46.2 - cpu_size[0],
                   board_size[1] - 22 - cpu_size[1],
                   0,
                 ];
  usb_size = [ 17.4, 14.5, 16 ];
  usb_position = [ board_size[0] + 7.1 - usb_size[0],
                   board_size[1] - 18.5 - usb_size[1],
                   0,
                 ];
  ethernet_size = [ 21.2, 16, 13.8 ];
  ethernet_position = [ board_size[0] + 1.4 - ethernet_size[0], 2.2, 0 ];
  hdmi_size = [ 15.1, 11.6, 6.2 ];
  hdmi_position = [ 36.9, -1.0, 0 ];
  gpio_size = [ 32.9, 5.1, 2.5 ];
  gpio_position = [ 0.9, board_size[1] - 1.2 - gpio_size[1], 0 ];
  pins_size = [ 31.1, 3.2, 6.1 ];
  pins_position = gpio_position + [ 1, 1.2, gpio_size[2] ];
  otg_size = [ 5.8, 8.0, 2.6 ];
  otg_position = [ -0.8, 3.5, 0 ];
  sd_socket_size = [ 17, 30.3, 3.5 ];
  sd_socket_position = [ 0.7, 14.2, - board_size[2] - sd_socket_size[2] ];
  rca_size = [ 9.9, 9.9, 13 ];
  rca_radius = 8.3 / 2;
  audio_size = [ 11.9, 11.5, 10.1 ];
  audio_position = [ 58.7, board_size[1] - 0.2 - audio_size[1], 0 ];
  audio_radius = 6.8 / 2;
  rca_position = [ 41.2, board_size[1] - rca_size[1] - 2.3, 0 ];
  sd_card_size = [ 32, 24, 2 ];
  sd_card_position = [ -17.6, 18.5, sd_socket_position[2] + 0.7 ];
  bypass_radius = 6.8 / 2;
  bypass_position = [ otg_position[0] + 10.6 + bypass_radius,
                      3.6 + bypass_radius,
                      0,
                    ];
  flex_size = [ 2.6, 22, 5.7 ];
  flex_1_position = [ 11.1, board_size[1] - flex_size[1] - 16.8, 0 ];
  flex_2_position = [ 57.4, -0.2, 0 ];
  black = [ 0.2, 0.2, 0.2 ]; // ..so shadows are apparent

  color("green")
  linear_extrude( height=board_size[2] )
  {
    difference()
    {
      square([ board_size[0], board_size[1] ]);
      translate( hole_1_position ) circle( r=mount_hole_radius );
      translate( hole_2_position ) circle( r=mount_hole_radius );
    }
  }
  translate([ 0, 0, board_size[2] ])
  {
    // The origin is now the top side of the board
    color( black )
    {
      translate( cpu_position ) cube( cpu_size );
      translate( sd_socket_position ) cube( sd_socket_size );
      translate( gpio_position ) cube( gpio_size );
      translate( audio_position )
      {
        cube( audio_size );
        translate([ audio_size[0]/2, audio_size[1], 4.7-board_size[2]+audio_radius ]) rotate([-90,0,0]) cylinder( r=audio_radius, h=3.4 );
      }
    }
    color("gold") translate( pins_position ) cube( pins_size );
    color("yellow") translate( rca_position ) cube( rca_size );
    color("blue") translate( sd_card_position ) cube( sd_card_size );
    color("silver")
    {
      translate( rca_position + [ rca_size[0]/2, rca_size[1], 3.8+rca_radius ] ) rotate([-90,0,0]) cylinder( r=rca_radius, h=9.4 );
      translate( usb_position ) cube( usb_size );
      translate( ethernet_position ) cube( ethernet_size );
      translate( hdmi_position ) cube( hdmi_size );
      translate( otg_position ) cube( otg_size );
      translate( bypass_position ) cylinder( r=6.8/2, h=7.7 );
    }
    color("white")
    {
      translate( flex_1_position ) cube( flex_size );
      translate( flex_2_position ) cube( flex_size );
    }
    // Show a warning zone for the highest component not explicitly modelled
    %cube([ board_size[0], board_size[1], 2.3 ]);
  }
}

board();

