from rtlsdr import RtlSdr 
import numpy as np 
import time 

sdr = RtlSdr()

sdr.sample_rate = 2.4e6
sdr.center_freq = 100e6
sdr.gain = 'auto'

print("Radio started")
print("Center freq:", sdr.center_freq) 

try: 
    while True: 
        samples = sdr.read_samples(256 * 1024) 
        
        spectrum = np.fft.fftshift(np.fft.fft(samples))
        power = 20 * np.log10(np.abs(spectrum))

        peak = np.max(power) 
        avg = np.mean(power)

        print(f"Peak: {peak:.1f} dB | Avg: {avg:.1f} dB")

        time.sleep(1)

except KeyboardInterrupt: 
        print("\nStopping")

finally: 
    sdr.close()         
