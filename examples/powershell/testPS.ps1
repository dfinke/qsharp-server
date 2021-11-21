Set-Location /workspaces/qsharp-server/examples/powershell

Import-Module ./qsharp.psd1

function SampleQrng {
    Build-QuantumProgram @"
open Microsoft.Quantum.Diagnostics;
operation SampleQrng() : Bool {
    use q = Qubit();
    H(q);
    DumpMachine();
    return M(q) == One;
}
"@

    Invoke-QuantumProgram SampleQrng -Simulator QuantumSimulator
}

function AllocateQubits {
    Build-QuantumProgram @"

operation AllocateQubits() {
    Message("Initial state |000>:");
    DumpMachine();    
}
"@

    Invoke-QuantumProgram AllocateQubits -Simulator QuantumSimulator
    
}

function Hello {
    Build-QuantumProgram @"

function Hello() : Int {
    Message("Hi!");
    return 42;
}
"@

    Invoke-QuantumProgram Hello -Simulator QuantumSimulator

}

# SampleQrng
# AllocateQubits

Hello