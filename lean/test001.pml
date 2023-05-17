chan qname = [16] of {short}
chan qname 

init  
{
  int val;
  int q;

  qname!18;
  qname!19;
  qname!20;

  qname?q;
  printf("1: %d\n", q);

  qname?q;
  printf("2: %d\n", q);

  qname?q;
  printf("3: %d\n", q);:
}
