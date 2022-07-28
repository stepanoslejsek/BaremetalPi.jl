# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
#
# Description
# ==============================================================================
#
#     Functions to manage the Serial.
#
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

function serial_open(devices::AbstractVector{String})

  # Number of devices that the user wants to open.
  num_open_devices = length(devices)

  # If we have already opened, then close all the devices first
  objects.serial_init && serial_close()

  # Prepare vector of SERIALDEV for multiple devices
  serialdev = Vector{SERIALDEV}(undef, 0)

  @inbounds for i = 1:num_open_devices
    try
      # Open the device
      # =================================================================
      io = open(devices[i], "w+")

      # Init TERMIOS2 in order to get default settings
      # =================================================================
      term = TERMIOS2(0, 0, 0, 0, 0, 0, 0)

      # Get current settings
      # =================================================================
      _ioctl(io, TCGETS2, Ref(term))

      # Pack values
      # =================================================================
      serialdev_i = SERIALDEV(io, term)
      push!(serialdev, serialdev_i)
    catch
      error("Could not open `$(devices[i])`. Make sure you have the required permissions.")
    end
  end

  objects.serialdev = serialdev
  return nothing
end

function serial_close()
  if objects.serial_init
    @inbounds for dev in objects.serialdev
      close(dev.io)
    end
    objects.serialdev = Vector{SERIALDEV}(undef, 0)
    objects.serial_init = false
  end
  return nothing
end

function serial_configure(device::SERIALDEV, term::TERMIOS2)
  _ioctl(device.io, TCSETS2, Ref(term))
end

function serial_read_bytes(device::SERIALDEV, buffer::AbstractVector{__u8})
  read!(device.io, buffer)
end

function serial_write_bytes(device::SERIALDEV, buffer::AbstractVector{__u8})
  write(device.io, buffer)
end
