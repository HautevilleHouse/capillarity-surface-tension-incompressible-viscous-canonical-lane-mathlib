import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CapillaritySurfaceTensionIncompressibleViscous

structure ViscousFreeSurfaceFlow where
  freeSurfacePosition : Type u
  normalVelocityContinuity : Prop
  tangentialStressBalance : Prop
  kinematicBoundaryCondition : Prop
  normalVelocityContinuityClosed : normalVelocityContinuity
  tangentialStressBalanceClosed : tangentialStressBalance
  kinematicBoundaryConditionClosed : kinematicBoundaryCondition

structure ViscousFreeSurfaceFlowEvidence (V : ViscousFreeSurfaceFlow) where
  normalVelocityContinuityClosed : V.normalVelocityContinuity
  tangentialStressBalanceClosed : V.tangentialStressBalance
  kinematicBoundaryConditionClosed : V.kinematicBoundaryCondition

def ViscousFreeSurfaceFlowClosed (V : ViscousFreeSurfaceFlow) : Prop :=
  V.normalVelocityContinuity ∧ V.tangentialStressBalance ∧ V.kinematicBoundaryCondition

theorem viscous_free_surface_flow_closed_from_evidence
    (V : ViscousFreeSurfaceFlow) (E : ViscousFreeSurfaceFlowEvidence V) :
    ViscousFreeSurfaceFlowClosed V := by
  exact And.intro E.normalVelocityContinuityClosed
    (And.intro E.tangentialStressBalanceClosed E.kinematicBoundaryConditionClosed)

end CapillaritySurfaceTensionIncompressibleViscous
end HautevilleHouse