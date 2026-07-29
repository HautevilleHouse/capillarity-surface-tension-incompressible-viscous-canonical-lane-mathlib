import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CapillaritySurfaceTensionIncompressibleViscousCanonicalLaneLean

structure StabilityAnalysisPackage where
  linearPerturbation : Type u
  growthRate : Type v
  rayleighTaylorStability : Prop
  weberNumberCriterion : Prop
  stabilityBoundary : Prop

structure StabilityAnalysisEvidence (S : StabilityAnalysisPackage) where
  rayleighTaylorStabilityClosed : S.rayleighTaylorStability
  weberNumberCriterionClosed : S.weberNumberCriterion
  stabilityBoundaryClosed : S.stabilityBoundary

def StabilityAnalysisClosed (S : StabilityAnalysisPackage) : Prop :=
  S.rayleighTaylorStability ∧ S.weberNumberCriterion ∧ S.stabilityBoundary

theorem stability_analysis_closed_from_evidence
    (S : StabilityAnalysisPackage) (E : StabilityAnalysisEvidence S) :
    StabilityAnalysisClosed S := by
  exact And.intro E.rayleighTaylorStabilityClosed
    (And.intro E.weberNumberCriterionClosed E.stabilityBoundaryClosed)

end CapillaritySurfaceTensionIncompressibleViscousCanonicalLaneLean
end HautevilleHouse