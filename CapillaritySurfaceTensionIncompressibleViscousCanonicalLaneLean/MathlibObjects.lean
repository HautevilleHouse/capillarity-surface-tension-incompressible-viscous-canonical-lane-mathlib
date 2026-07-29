import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CapillaritySurfaceTensionIncompressibleViscousCanonicalLaneLean

structure CapillaritySpace where
  carrier : Type
  topology : TopologicalSpace carrier

structure CapillarityAdmittedObject where
  space : CapillaritySpace
  threeDimensionalContinuum : Prop
  interfacePresent : Prop
  fluidModel : Type
  fluidTopology : TopologicalSpace fluidModel
  navierStokesCapillaritySatisfied : Prop
  conclusion : navierStokesCapillaritySatisfied

def CapillarityWitnessClosed (O : CapillarityAdmittedObject) : Prop :=
  O.navierStokesCapillaritySatisfied

end CapillaritySurfaceTensionIncompressibleViscousCanonicalLaneLean
end HautevilleHouse
