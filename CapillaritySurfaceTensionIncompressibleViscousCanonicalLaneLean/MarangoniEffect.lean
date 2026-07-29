import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CapillaritySurfaceTensionIncompressibleViscousCanonicalLaneLean

structure MarangoniEffectPackage where
  temperatureField : Type u
  surfactantConcentration : Type v
  surfaceTensionGradient : Prop
  marangoniStress : Prop
  surfaceTensionGradientTerm : surfaceTensionGradient
  marangoniStressTerm : marangoniStress

structure MarangoniEffectEvidence (M : MarangoniEffectPackage) where
  surfaceTensionGradientClosed : M.surfaceTensionGradient
  marangoniStressClosed : M.marangoniStress

def MarangoniEffectClosed (M : MarangoniEffectPackage) : Prop :=
  M.surfaceTensionGradient ∧ M.marangoniStress

theorem marangoni_effect_closed_from_evidence
    (M : MarangoniEffectPackage) (E : MarangoniEffectEvidence M) :
    MarangoniEffectClosed M := by
  exact And.intro E.surfaceTensionGradientClosed E.marangoniStressClosed

end CapillaritySurfaceTensionIncompressibleViscousCanonicalLaneLean
end HautevilleHouse