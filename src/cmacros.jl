# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
#
# Description
# ==============================================================================
#
#     Define the functions that replica some required C macros.
#
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

################################################################################
#                                    IOCTL
################################################################################

# Constants and macros obtained from `linux/include/uapi/asm-generic/ioctl.h`
# tag 4.19.

const _IOC_NRBITS = 8
const _IOC_TYPEBITS = 8

const _IOC_SIZEBITS = 14
const _IOC_DIRBITS = 2

const _IOC_NRMASK = ((1 << _IOC_NRBITS) - 1)
const _IOC_TYPEMASK = ((1 << _IOC_TYPEBITS) - 1)
const _IOC_SIZEMASK = ((1 << _IOC_SIZEBITS) - 1)
const _IOC_DIRMASK = ((1 << _IOC_DIRBITS) - 1)

const _IOC_NRSHIFT = 0
const _IOC_TYPESHIFT = (_IOC_NRSHIFT + _IOC_NRBITS)
const _IOC_SIZESHIFT = (_IOC_TYPESHIFT + _IOC_TYPEBITS)
const _IOC_DIRSHIFT = (_IOC_SIZESHIFT + _IOC_SIZEBITS)

const _IOC_WRITE = UInt32(1)
const _IOC_READ = UInt32(2)

function _IOC(dir, type, nr, size)
  return (dir << _IOC_DIRSHIFT) |
         (type << _IOC_TYPESHIFT) |
         (nr << _IOC_NRSHIFT) |
         (size << _IOC_SIZESHIFT)
end

_IOW(type, nr, size) = _IOC(_IOC_WRITE, type, nr, size)
_IOR(type, nr, size) = _IOC(_IOC_READ, type, nr, size)

################################################################################
#                                     I2C
################################################################################

# Constants and macros obtained from `linux/include/uapi/linux/i2c-dev.h` tag
# v4.19.

const I2C_SLAVE = 0x0703
const I2C_SLAVE_FORCE = 0x0706
const I2C_TENBIT = 0x0704
const I2C_FUNCS = 0x0705
const I2C_RDWR = 0x0707
const I2C_PEC = 0x0708
const I2C_SMBUS = 0x0720

# Functionality
# ==============================================================================

# Constants and macros obtained from `linux/include/uapi/linux/i2c.h` tag v4.19.

const I2C_FUNC_I2C = 0x00000001
const I2C_FUNC_10BIT_ADDR = 0x00000002
const I2C_FUNC_PROTOCOL_MANGLING = 0x00000004
const I2C_FUNC_SMBUS_PEC = 0x00000008
const I2C_FUNC_NOSTART = 0x00000010
const I2C_FUNC_SLAVE = 0x00000020
const I2C_FUNC_SMBUS_BLOCK_PROC_CALL = 0x00008000
const I2C_FUNC_SMBUS_QUICK = 0x00010000
const I2C_FUNC_SMBUS_READ_BYTE = 0x00020000
const I2C_FUNC_SMBUS_WRITE_BYTE = 0x00040000
const I2C_FUNC_SMBUS_READ_BYTE_DATA = 0x00080000
const I2C_FUNC_SMBUS_WRITE_BYTE_DATA = 0x00100000
const I2C_FUNC_SMBUS_READ_WORD_DATA = 0x00200000
const I2C_FUNC_SMBUS_WRITE_WORD_DATA = 0x00400000
const I2C_FUNC_SMBUS_PROC_CALL = 0x00800000
const I2C_FUNC_SMBUS_READ_BLOCK_DATA = 0x01000000
const I2C_FUNC_SMBUS_WRITE_BLOCK_DATA = 0x02000000
const I2C_FUNC_SMBUS_READ_I2C_BLOCK = 0x04000000
const I2C_FUNC_SMBUS_WRITE_I2C_BLOCK = 0x08000000
const I2C_FUNC_SMBUS_HOST_NOTIFY = 0x10000000

const I2C_FUNC_SMBUS_BYTE = (I2C_FUNC_SMBUS_READ_BYTE | I2C_FUNC_SMBUS_WRITE_BYTE)

const I2C_FUNC_SMBUS_BYTE_DATA = (
  I2C_FUNC_SMBUS_READ_BYTE_DATA | I2C_FUNC_SMBUS_WRITE_BYTE_DATA
)

const I2C_FUNC_SMBUS_WORD_DATA = (
  I2C_FUNC_SMBUS_READ_WORD_DATA | I2C_FUNC_SMBUS_WRITE_WORD_DATA
)

const I2C_FUNC_SMBUS_BLOCK_DATA = (
  I2C_FUNC_SMBUS_READ_BLOCK_DATA | I2C_FUNC_SMBUS_WRITE_BLOCK_DATA
)

const I2C_FUNC_SMBUS_I2C_BLOCK = (
  I2C_FUNC_SMBUS_READ_I2C_BLOCK | I2C_FUNC_SMBUS_WRITE_I2C_BLOCK
)

const I2C_FUNC_SMBUS_EMUL = (
  I2C_FUNC_SMBUS_QUICK |
  I2C_FUNC_SMBUS_BYTE |
  I2C_FUNC_SMBUS_BYTE_DATA |
  I2C_FUNC_SMBUS_WORD_DATA |
  I2C_FUNC_SMBUS_PROC_CALL |
  I2C_FUNC_SMBUS_WRITE_BLOCK_DATA |
  I2C_FUNC_SMBUS_I2C_BLOCK |
  I2C_FUNC_SMBUS_PEC
)

const I2C_SMBUS_BLOCK_MAX = UInt8(32)
const I2C_SMBUS_READ = 0x01
const I2C_SMBUS_WRITE = 0x00
const I2C_SMBUS_QUICK = UInt32(0)
const I2C_SMBUS_BYTE = UInt32(1)
const I2C_SMBUS_BYTE_DATA = UInt32(2)
const I2C_SMBUS_WORD_DATA = UInt32(3)
const I2C_SMBUS_PROC_CALL = UInt32(4)
const I2C_SMBUS_BLOCK_DATA = UInt32(5)
const I2C_SMBUS_I2C_BLOCK_BROKEN = UInt32(6)
const I2C_SMBUS_BLOCK_PROC_CALL = UInt32(7)
const I2C_SMBUS_I2C_BLOCK_DATA = UInt32(8)

################################################################################
#                                     SPI
################################################################################

# Constants and macros obtained from `linux/include/uapi/linux/spi/spidev.h` tag
# v4.19.
const SPI_CPHA = 0x01
const SPI_CPOL = 0x02

const SPI_MODE_0 = (0 | 0)
const SPI_MODE_1 = (0 | SPI_CPHA)
const SPI_MODE_2 = (SPI_CPOL | 0)
const SPI_MODE_3 = (SPI_CPOL | SPI_CPHA)

const SPI_CS_HIGH = 0x04
const SPI_LSB_FIRST = 0x08
const SPI_3WIRE = 0x10
const SPI_LOOP = 0x20
const SPI_NO_CS = 0x40
const SPI_READY = 0x80

const SPI_IOC_MAGIC = UInt('k')

function SPI_MSGSIZE(N)
  if (N * sizeof(struct_spi_ioc_transfer)) < (1 << _IOC_SIZEBITS)
    return N * sizeof(struct_spi_ioc_transfer)
  else
    return 0
  end
end

# In the past, we were using `NTuple{SPI_MSGSIZE(N), Cchar}` to create a type so
# that the function `_IOC_TYPECHECK(t) = sizeof(t)` could retrieve the correct
# size. However, this was causing 3 allocations. Thus, the system was simplified
# to avoid this. Now, the functions `_IOR` and `_IOW` must receive the size
# instead of the type as it was coded in the Kernel source.
SPI_IOC_MESSAGE(N) = _IOW(SPI_IOC_MAGIC, 0, sizeof(Cchar) * SPI_MSGSIZE(N))

const SPI_IOC_RD_MODE = _IOR(SPI_IOC_MAGIC, 1, sizeof(__u8))
const SPI_IOC_WR_MODE = _IOW(SPI_IOC_MAGIC, 1, sizeof(__u8))

const SPI_IOC_RD_LSB_FIRST = _IOR(SPI_IOC_MAGIC, 2, sizeof(__u8))
const SPI_IOC_WR_LSB_FIRST = _IOW(SPI_IOC_MAGIC, 2, sizeof(__u8))

const SPI_IOC_RD_BITS_PER_WORD = _IOR(SPI_IOC_MAGIC, 3, sizeof(__u8))
const SPI_IOC_WR_BITS_PER_WORD = _IOW(SPI_IOC_MAGIC, 3, sizeof(__u8))

const SPI_IOC_RD_MAX_SPEED_HZ = _IOR(SPI_IOC_MAGIC, 4, sizeof(__u32))
const SPI_IOC_WR_MAX_SPEED_HZ = _IOW(SPI_IOC_MAGIC, 4, sizeof(__u32))

################################################################################
#                                     SERIAL
################################################################################

const NCCS = 32

# Macros for c_cc characters defined in /usr/include/bits/termios-c_cc.h
const VINTR = 0
const VQUIT = 1
const VERASE = 2
const VKILL = 3
const VEOF = 4
const VTIME = 5
const VMIN = 6
const VSWTC = 7
const VSTART = 8
const VSTOP = 9
const VSUSP = 10
const VEOL = 11
const VREPRINT = 12
const VDISCARD = 13
const VWERASE = 14
const VLNEXT = 15
const VEOL2 = 16

# Macros for c_cflag bits defined in /usr/include/bits/termios-c_cflag.h
const CSIZE = 60
const CS5 = 0
const CS6 = 20
const CS7 = 40
const CS8 = 60
const CSTOPB = 100
const CREAD = 200
const PARENB = 400
const PARODD = 1000
const HUPCL = 2000
const CLOCAL = 4000

# Macros for c_iflag bits defined in /usr/include/bits/termios-c_iflag.h
const IGNBRK = 1     # Ignore break condition
const BRKINT = 2     # Signal interrupt on break
const IGNPAR = 4     # Ignore characters with parity errors
const PARMRK = 10    # Mark parity and framing errors
const INPCK = 20    # Enable input parity check
const ISTRIP = 40    # Strip 8th bit off characters
const INLCR = 100   # Map NL to CR on input
const IGNCR = 200   # Ignore CR
const ICRNL = 400   # Map CR to NL on input
const IUCLC = 1000  # Map uppercase characters to lowercase on input
const IXON = 2000  # Enable start/stop output control
const IXANY = 4000  # Enable any character to restart output
const IXOFF = 10000 # Enable start/stop input control
const IMAXBEL = 20000 # Ring bell when input queue is full
const IUTF8 = 40000 # Input is UTF8

# Macros for c_lfrag bits defined in /usr/include/bits/termios-c_lflag.h
const ISIG = 1      # Enable signals
const ICANON = 2      # Canonical input (erase and kill processing)
const ECHO = 10     # Enable echo
const ECHOE = 20     # Echo erase character as error-correcting backspace
const ECHOK = 40     # Echo KILL
const ECHONL = 100    # Echo NL
const NOFLSH = 200    # Disable flush after interrupt or quit
const TOTOP = 400    # Send SIGTTOU for background output
const ECHOCTL = 1000   # If ECHO is also set, terminal secial characters other than TAB, NL, START and STOP are echoed as ^X, where X is the character with ASCII code 0x40 greater than the special character
const ECHOPORT = 2000   # If ICANON and ECHO are also set, characters are printed as they are being erased
const ECHOKE = 4000   # If ICANON is also set, KILL is echoed by erasing each character on the line, as specified by ECHOE and ECHOPRT
const FLUSHO = 10000  # Output is being flushed. This flag is toggled by typing the DISCARD character
const PENDIN = 40000  # All characters in the input queue are reprinted when the next character is read
const IEXTEN = 100000 # Enable implementation-defined input processing
const EXTPROC = 200000

# Macros for c_oflag bits defined in /usr/include/bits/termios-c_oflag.h
const OPOST = 1      # Post-process output
const OLCUC = 2      # Map lowercase charactersto uppercase on output
const ONLCR = 4      # Map NL to CO-NL on output
const OCRNL = 10     # Map CR to NL on output
const ONOCR = 20     # No CR output at column 0
const ONLRET = 40     # NL performs CR function
const OFILL = 100    # Use fill characters for delay
const OFDEL = 200    # Fill is DEL
const NLDLY = 400    # Select newline delays
const NL0 = 0      # Newline type 0
const NL1 = 400    # Newline type 1
const CRDLY = 3000   # Select carriage-return delays
const CR0 = 0      # Carriage-return delay type 0
const CR1 = 1000   # Carriage-return delay type 1
const CR2 = 2000   # Carriage-return delay type 2
const CR3 = 3000   # Carriage-return delay type 3
const TABDLY = 14000  # Select horizontal-tab delays
const TAB0 = 0      # Horizontal-tab delay type 0
const TAB1 = 4000   # Horizontal-tab delay type 1
const TAB2 = 10000  # Horizontal-tab delay type 2
const TAB3 = 14000  # Expand tabs to spaces
const BSDLY = 20000  # Select backspace delays
const BS0 = 0      # Backspace-delay type 0
const BS1 = 20000  # Backspace-delay type 1
const FFDLY = 100000 # Select form-feed delays
const FF0 = 0      # Form-feed delay type 0
const FF1 = 100000 # Form-feed delay type 1
const VTDLY = 40000  # Select vertical-tab delays
const VT0 = 0      # Vertical-tab delay type 0
const VT1 = 40000  # Vertiacal-tab delay type 1

const TCSANOW = 0
const TCSADRAIN = 1
const TCSAFLUSH = 2

# Macros for baud rate defined in /usr/include/bits/termios-baud.h and termios.h
const B0 = 0
const B50 = 1
const B75 = 2
const B110 = 3
const B134 = 4
const B150 = 5
const B200 = 6
const B300 = 7
const B600 = 10
const B1200 = 11
const B1800 = 12
const B2400 = 13
const B4800 = 14
const B9600 = 15
const B19200 = 16
const B38400 = 17
const B57600 = 10001
const B115200 = 10002
const B230400 = 10003
const B460800 = 10004
const B500000 = 10005
const B576000 = 10006
const B921600 = 10007
const B1000000 = 10010
const B1152000 = 10011
const B1500000 = 10012
const B2000000 = 10013
const B2500000 = 10014
const B3000000 = 10015
const B3500000 = 10016
const B4000000 = 10017

const TERMIOS_IOC_MAGIC = UInt('T')
#const TCSETS = _IOW(TERMIOS_IOC_MAGIC, 14, struct termios)
