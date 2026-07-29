import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CapillaritySurfaceTensionIncompressibleViscousCanonicalLaneLean

structure CapillaryAdmittedObject where
  fluidDomain : Type u
  interfaceSurface : Type v
  surfaceTension : ℝ
  viscosity : ℝ
  incompressible : Prop
  navierStokesSatisfied : Prop
  interfaceBalanceSatisfied : Prop
  conclusion : interfaceBalanceSatisfied

structure AdmissibleClass where
  object : CapillaryAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  CapillaryWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

def CapillaryWitnessClosed (O : CapillaryAdmittedObject) : Prop :=
  O.interfaceBalanceSatisfied

end CapillaritySurfaceTensionIncompressibleViscousCanonicalLaneLean
end HautevilleHouse