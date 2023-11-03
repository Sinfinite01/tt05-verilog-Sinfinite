import cocotb
from cocotb.clock import Clock
from cocotb.triggers import RisingEdge, FallingEdge, Timer, ClockCycles


# @cocotb.test()
# async def test_my_design(dut):
#     dut._log.info("start")

@cocotb.test()
async def test_my_design1(dut):  #dut = device under test

    CONSTANT_INPUT1 = my_variable1 = 0b10101010 # This represents 4 inputs of 1 and 0 alternating
    CONSTANT_INPUT2 = my_variable2 = 0b00000000 # This represents 7 inputs of 0

    dut._log.info("starting simulation...")

    # initializing clock
    clock = Clock(dut.clk, 1, units="ns")
    cocotb.start_soon(clock.start())

    dut.rst_n.value = 0 # active low reset

    await ClockCycles(dut.clk, 10)
    dut.rst_n.value = 1 # take out of reset

    dut.ui_in.value = CONSTANT_INPUT1
    dut.uio_in.value = CONSTANT_INPUT2
    dut.ena.value = 1 # enable design

    for _ in range(100):
        await RisingEdge(dut.clk)

    dut._log.info("done?") 

@cocotb.test()
async def test_my_design2(dut):  #dut = device under test

    CONSTANT_INPUT1 = my_variable = 0b00000000 # This represents 7 inputs of 0  and 1 input of 1
    CONSTANT_INPUT2 = my_variable2 = 0b00000000 # This represents 7 inputs of 0

    dut._log.info("starting simulation...")

    # initializing clock
    clock = Clock(dut.clk, 1, units="ns")
    cocotb.start_soon(clock.start())

    dut.rst_n.value = 0 # active low reset

    await ClockCycles(dut.clk, 10)
    dut.rst_n.value = 1 # take out of reset

    dut.ui_in.value = CONSTANT_INPUT1
    dut.uio_in.value = CONSTANT_INPUT2
    dut.ena.value = 1 # enable design

    for _ in range(100):
        await RisingEdge(dut.clk)

    dut._log.info("done?")

@cocotb.test()
async def test_my_design3(dut):  #dut = device under test

    CONSTANT_INPUT1 = my_variable = 0b00000001 # This represents 7 inputs of 0  and 1 input of 1
    CONSTANT_INPUT2 = my_variable2 = 0b00000000 # This represents 7 inputs of 0

    dut._log.info("starting simulation...")

    # initializing clock
    clock = Clock(dut.clk, 1, units="ns")
    cocotb.start_soon(clock.start())

    dut.rst_n.value = 0 # active low reset

    await ClockCycles(dut.clk, 10)
    dut.rst_n.value = 1 # take out of reset

    dut.ui_in.value = CONSTANT_INPUT1
    dut.uio_in.value = CONSTANT_INPUT2
    dut.ena.value = 1 # enable design

    for _ in range(100):
        await RisingEdge(dut.clk)

    dut._log.info("done?")

@cocotb.test()
async def test_my_design4(dut):  #dut = device under test

    CONSTANT_INPUT1 = my_variable = 0b00000011 # This represents 6 inputs of 0  and 5 input of 1
    CONSTANT_INPUT2 = my_variable2 = 0b00000000 # This represents 7 inputs of 0

    dut._log.info("starting simulation...")

    # initializing clock
    clock = Clock(dut.clk, 1, units="ns")
    cocotb.start_soon(clock.start())

    dut.rst_n.value = 0 # active low reset

    await ClockCycles(dut.clk, 10)
    dut.rst_n.value = 1 # take out of reset

    dut.ui_in.value = CONSTANT_INPUT1
    dut.uio_in.value = CONSTANT_INPUT2
    dut.ena.value = 1 # enable design

    for _ in range(100):
        await RisingEdge(dut.clk)

    dut._log.info("done?")

@cocotb.test()
async def test_my_design5(dut):  #dut = device under test

    CONSTANT_INPUT1 = my_variable = 0b00000000 # This represents 6 inputs of 0  and 5 input of 1
    CONSTANT_INPUT2 = my_variable2 = 0b00000001 # This represents 7 inputs of 0

    dut._log.info("starting simulation...")

    # initializing clock
    clock = Clock(dut.clk, 1, units="ns")
    cocotb.start_soon(clock.start())

    dut.rst_n.value = 0 # active low reset

    await ClockCycles(dut.clk, 10)
    dut.rst_n.value = 1 # take out of reset

    dut.ui_in.value = CONSTANT_INPUT1
    dut.uio_in.value = CONSTANT_INPUT2
    dut.ena.value = 1 # enable design

    for _ in range(100):
        await RisingEdge(dut.clk)

    dut._log.info("done?")

@cocotb.test()
async def test_my_design6(dut):  #dut = device under test

    CONSTANT_INPUT1 = my_variable = 0b00000001 # This represents 6 inputs of 0  and 5 input of 1
    CONSTANT_INPUT2 = my_variable2 = 0b00000001 # This represents 7 inputs of 0

    dut._log.info("starting simulation...")

    # initializing clock
    clock = Clock(dut.clk, 1, units="ns")
    cocotb.start_soon(clock.start())

    dut.rst_n.value = 0 # active low reset

    await ClockCycles(dut.clk, 10)
    dut.rst_n.value = 1 # take out of reset

    dut.ui_in.value = CONSTANT_INPUT1
    dut.uio_in.value = CONSTANT_INPUT2
    dut.ena.value = 1 # enable design

    for _ in range(100):
        await RisingEdge(dut.clk)

    dut._log.info("done?")