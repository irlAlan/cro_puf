

package type_pkg;

typedef struct packed {
   logic c;
   logic u;
   logic d;
   logic l;
   logic r;
}Btn_t;


typedef struct {
   logic [3:0] an;
   logic [7:0] seg;
   logic bp;
}Seg_t;
    
endpackage