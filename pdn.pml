// Types of products we work with 
mtype = { PROD_MILK, 
          PROD_BREAD, 
          PROD_EGGS, 
          PROD_BUTTER, 
          PROD_CHEESE };

// Shelf and customers interact trough counter channel
chan counter = [100] of { mtype, int };

// Supercustomer has a specific consumption rate for each type of product
#define PROD_MILK_INITIAL_RATE 10
#define PROD_BREAD_INITIAL_RATE 20
#define PROD_EGGS_INITIAL_RATE 15
#define PROD_BUTTER_INITIAL_RATE 8
#define PROD_CHEESE_INITIAL 12


// Supercustomer process definition
proctype Supercustomer(mtype product, byte initial_rate) {

    // Initialize current_rate with initial_rate
    byte current_rate = initial_rate;
    // Each supercustomer has a separate RNG
    byte rng;

    printf("Supercustomer %m rate: %d", product, rate);
    do
    :: true -> // This process will always be able to execute this branch
        rng = _random() % 101; // Generate random number in range [0, 100]

        // If the random number is less than the current rate, send a request
        if
        :: (rng < current_rate) ->
            // Send a request to consume the product through the counter channel
            counter!product, 1;
            
            // Optionally change the current rate
            if
            :: (current_rate > 0) -> current_rate = current_rate - 1;
            :: (current_rate < 100) -> current_rate = current_rate + 1;
            :: else -> skip;
        :: else -> skip;
    od
}


init {
    run Supercustomer(PROD_MILK, PROD_MILK_INITIAL_RATE);
    run Supercustomer(PROD_BREAD, PROD_BREAD_INITIAL_RATE);
    run Supercustomer(PROD_EGGS, PROD_EGGS_INITIAL_RATE);
    run Supercustomer(PROD_BUTTER, PROD_BUTTER_INITIAL_RATE);
    run Supercustomer(PROD_CHEESE, PROD_CHEESE_INITIAL_RATE);
}
