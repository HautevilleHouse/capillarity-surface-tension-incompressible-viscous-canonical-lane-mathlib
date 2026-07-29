import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CapillaritySurfaceTensionIncompressibleViscousCanonicalLaneLean

structure ContactLineDynamicsPackage where
  contactAngle : ℝ
  slipLength : ℝ
  advancingReceding : Prop
  stressSingularityRegularization : Prop
  hysteresisModel : Prop

structure ContactLineDynamicsEvidence (C : ContactLineDynamicsPackage) where
  advancingRecedingClosed : C.advancingReceding
  stressSingularityRegularizationClosed : C.stressSingularityRegularization
  hysteresisModelClosed : C.hysteresisModel

def ContactLineDynamicsClosed (C : ContactLineDynamicsPackage) : Prop :=
  C.advancingReceding ∧ C.stressSingularityRegularization ∧ C.hysteresisModel

theorem contact_line_dynamics_closed_from_evidence (C : ContactLineDynamicsPackage) (E : ContactLineDynamicsEvidence C) :
    ContactLineDynamicsClosed C := by
  exact And.intro E.advancingRecedingClosed (And.intro E.stressSingularityRegularizationClosed E.hysteresisModelClosed)

end CapillaritySurfaceTensionIncompressibleViscousCanonicalLaneLean
end HautevilleHouse