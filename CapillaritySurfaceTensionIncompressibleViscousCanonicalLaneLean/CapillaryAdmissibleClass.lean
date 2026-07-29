import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CapillaritySurfaceTensionIncompressibleViscousCanonicalLaneLean

structure CapillaryAdmittedObject where
  fluidDomain : Type
  interface : Type
  surfaceTensionCoefficient : Float
  viscousDensity : Float
  admissibleFlow : Prop
  conclusion : admissibleFlow

structure AdmissibleClass where
  object : CapillaryAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end CapillaritySurfaceTensionIncompressibleViscousCanonicalLaneLean
end HautevilleHouse