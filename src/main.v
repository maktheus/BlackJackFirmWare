module main;

    // Tempo de clock
    parameter CLK_PERIOD = 10;

    // Sinais de entrada
    reg clk;
    reg wr_en;
    reg [5:0] addr;
    reg [3:0] data_in;

    // Sinais de saída
    wire [3:0] data_out;

    // Instanciando o módulo ram
    ram ram_inst(.clk(clk), .wr_en(wr_en), .addr(addr), .data_in(data_in), .data_out(data_out));

    // Gerando o sinal de clock
    always begin
        # (CLK_PERIOD / 2) clk = ~clk;
    end

    // Testes
    initial begin
        clk = 0;
        wr_en = 1;

        // Escrevendo dados na memória
        addr = 6'b000001;
        data_in = 4'b1010;
        #CLK_PERIOD;

        addr = 6'b000010;
        data_in = 4'b1100;
        #CLK_PERIOD;

        // Embaralhando o baralho
        wr_en = 0;
        #CLK_PERIOD;

        // Lendo dados da memória
        addr = 6'b000001;
        #CLK_PERIOD;
        $display("Dado na posição %d: %d", addr, data_out);

        addr = 6'b000010;
        #CLK_PERIOD;
        $display("Dado na posição %d: %d", addr, data_out);

        // Finalizar a simulação
        $finish;
    end



endmodule