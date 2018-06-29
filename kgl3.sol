pragma solidity ^0.4.0;

/*
0xca35b7d915458ef540ade6068dfe2f44e8fa733c,
"A123456(7)",
"NASCIMENTO, Edson Arantes do",
77,
100,
"blue 2171 CP",
"rhombus",
"Pfizer"

0x14723a09acff6d2a60dcdf7aa4aff308fddc160c,
"B987654(3)",
"KENT, CLark",
34,
3,
"purple 2074 C",
"capsule",
"nexium 40mg"
*/
contract Register {
    
    struct Patient {
        
        string HKIDnumber;
        string HKIDname;
        uint age;
        uint InspectQuantity;
        string InspectColour;
        string InspectShape;
        string InspectMarkings;
    }
    
    mapping (address => Patient) patients;
    address[] public patientAccts;
    
    function setPatient(
    address _address, 
    string _HKIDnumber, 
    string _HKIDname, 
    uint _age,
    uint _InspectQuantity,
    string _InspectColour,
    string _InspectShape,
    string _InspectMarkings
    ) public {
        
        var patient = patients[_address];
    
        patient.HKIDnumber = _HKIDnumber;
        patient.HKIDname = _HKIDname;
        patient.age = _age;
        patient.InspectQuantity = _InspectQuantity;
        patient.InspectColour = _InspectColour;
        patient.InspectShape = _InspectShape;
        patient.InspectMarkings = _InspectMarkings;
        
        patientAccts.push(_address) -1;
    }
    
    function getpatients() view public returns(address[]) {
        return patientAccts;
    }
    
    function getPatient(address _address) view public returns (
        string, 
        string, 
        uint, 
        uint, 
        string, 
        string, 
        string) {
        
        return (
            patients[_address].HKIDnumber, 
            patients[_address].HKIDname, 
            patients[_address].age, 
            patients[_address].InspectQuantity,
            patients[_address].InspectColour,
            patients[_address].InspectShape,
            patients[_address].InspectMarkings
            );
    }
    
    function countPatients() view public returns (uint) {
        return patientAccts.length;
    }
    
}
