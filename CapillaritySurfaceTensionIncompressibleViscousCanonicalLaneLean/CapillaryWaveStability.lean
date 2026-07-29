import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CapillaritySurfaceTensionIncompressibleViscous

structure CapillaryWaveStability where
  waveMode : Type u
  dispersionRelation : Prop
  growthRateBounded : Prop
  surfaceTensionStabilization : Prop
  dispersionRelationClosed : dispersionRelation
  growthRateBoundedClosed : growthRateBounded
  surfaceTensionStabilizationClosed : surfaceTensionStabilization

structure CapillaryWaveStabilityEvidence (C : CapillaryWaveStability) where
  dispersionRelationClosed : C.dispersionRelation
  growthRateBoundedClosed : C.growthRateBounded
  surfaceTensionStabilizationClosed : C.surfaceTensionStabilization

def CapillaryWaveStabilityClosed (C : CapillaryWaveStability) : Prop :=
  C.dispersionRelation ∧ C.growthRateBounded ∧ C.surfaceTensionStabilization

theorem capillary_wave_stability_closed_from_evidence
    (C : CapillaryWaveStability) (E : CapillaryWaveStabilityEvidence C) :
    CapillaryWaveStabilityClosed C := by
  exact And.intro E.dispersionRelationClosed
    (And.intro E.growthRateBoundedClosed E.surfaceTensionStabilizationClosed)

end CapillaritySurfaceTensionIncompressibleViscous
end HautevilleHouse