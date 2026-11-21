import platform
import os
import subprocess
import sys

def verify_environment():
    print("=== EdgeVision: Environment Verification ===")
    print(f"System Architecture : {platform.machine()}")
    print(f"Operating System    : {platform.system()} {platform.release()}")
    print(f"Python Version      : {platform.python_version()}")
    
    cpu_count = os.cpu_count()
    print(f"Active CPU Cores    : {cpu_count}")
    
    # Cross-platform memory check
    if platform.system() == "Linux":
        try:
            with open('/proc/meminfo', 'r') as f:
                lines = f.readlines()
                total_mem = [line for line in lines if 'MemTotal' in line][0]
            print(f"Memory Status       : {total_mem.strip()}")
        except Exception as e:
            print(f"Memory Status       : Could not read /proc/meminfo ({e})")
    elif platform.system() == "Darwin":
        try:
            mem_bytes = subprocess.check_output(['sysctl', '-n', 'hw.memsize']).decode('utf-8').strip()
            mem_gb = int(mem_bytes) / (1024**3)
            print(f"Memory Status       : Total RAM: {mem_gb:.2f} GB (Running on Host Mac)")
        except Exception:
            print("Memory Status       : Mac memory query failed")
            
    print("\n[SUCCESS] Script executed successfully.")

if __name__ == "__main__":
    verify_environment()
