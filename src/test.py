import cocotb
from cocotb.clock import Clock
from cocotb.triggers import RisingEdge, FallingEdge, Timer, ClockCycles


# @cocotb.test()
# async def test_my_design(dut):
#     dut._log.info("start")

@cocotb.test()
async def test_my_design1(dut):  #dut = device under test

    CONSTANT_INPUT = my_variable = 0b10101010 # we can do up to 2^8-1 which is 255

    dut._log.info("starting simulation...")

    # initializing clock
    clock = Clock(dut.clk, 1, units="ns")
    cocotb.start_soon(clock.start())

    dut.rst_n.value = 0 # active low reset

    await ClockCycles(dut.clk, 10)
    dut.rst_n.value = 1 # take out of reset

    dut.ui_in.value = CONSTANT_INPUT
    dut.ena.value = 1 # enable design

    for _ in range(100):
        await RisingEdge(dut.clk)

    dut._log.info("done?") 

@cocotb.test()
async def test_my_design2(dut):  #dut = device under test

    CONSTANT_INPUT = my_variable = 0b00000000 # we can do up to 2^8-1 which is 255

    dut._log.info("starting simulation...")

    # initializing clock
    clock = Clock(dut.clk, 1, units="ns")
    cocotb.start_soon(clock.start())

    dut.rst_n.value = 0 # active low reset

    await ClockCycles(dut.clk, 10)
    dut.rst_n.value = 1 # take out of reset

    dut.ui_in.value = CONSTANT_INPUT
    dut.ena.value = 1 # enable design

    for _ in range(100):
        await RisingEdge(dut.clk)

    dut._log.info("done?")