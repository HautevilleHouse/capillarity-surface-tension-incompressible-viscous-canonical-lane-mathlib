import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CapillaritySurfaceTensionIncompressibleViscous

structure AdmissibleClass where
  object : CapillaryAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  CapillaryWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end CapillaritySurfaceTensionIncompressibleViscous
end HautevilleHouse