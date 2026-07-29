import CapillaritySurfaceTensionIncompressibleViscousCanonicalLaneLean.CapillaryInterface

namespace HautevilleHouse
namespace CapillaritySurfaceTensionIncompressibleViscousCanonicalLaneLean

structure SurfaceTensionModelPackage {C : CapillaryInterfacePackage} where
  temperatureDependent : Prop
  surfactantEffect : Prop
  marangoniStress : Prop
  taylorExpansionValid : Prop

structure SurfaceTensionModelEvidence {C : CapillaryInterfacePackage}
    (S : SurfaceTensionModelPackage C) where
  temperatureDependentClosed : S.temperatureDependent
  surfactantEffectClosed : S.surfactantEffect
  marangoniStressClosed : S.marangoniStress
  taylorExpansionValidClosed : S.taylorExpansionValid

def SurfaceTensionModelClosed {C : CapillaryInterfacePackage}
    (S : SurfaceTensionModelPackage C) : Prop :=
  S.temperatureDependent ∧ S.surfactantEffect ∧
  S.marangoniStress ∧ S.taylorExpansionValid

theorem surface_tension_model_closed_from_evidence
    {C : CapillaryInterfacePackage} (S : SurfaceTensionModelPackage C)
    (E : SurfaceTensionModelEvidence S) : SurfaceTensionModelClosed S := by
  exact And.intro E.temperatureDependentClosed
    (And.intro E.surfactantEffectClosed
      (And.intro E.marangoniStressClosed E.taylorExpansionValidClosed))

end CapillaritySurfaceTensionIncompressibleViscousCanonicalLaneLean
end HautevilleHouse