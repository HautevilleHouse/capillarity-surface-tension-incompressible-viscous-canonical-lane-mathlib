import HautevilleHouse.CapillaritySurfaceTensionIncompressibleViscousCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace CapillaritySurfaceTensionIncompressibleViscousCanonicalLaneLean

structure CapillaritySpace where
  carrier : Type
  topology : TopologicalSpace carrier

structure CapillarityAdmittedObject where
  space : CapillaritySpace
  fluidDomain : Prop
  interfaceModel : Prop
  surfaceTensionCoefficient : Prop
  incompressibilityCondition : Prop
  viscosityPositive : Prop
  conclusion : surfaceTensionCoefficient ∧ incompressibilityCondition ∧ viscosityPositive

def CapillarityWitnessClosed (O : CapillarityAdmittedObject) : Prop :=
  O.conclusion

end CapillaritySurfaceTensionIncompressibleViscousCanonicalLaneLean
end HautevilleHouse